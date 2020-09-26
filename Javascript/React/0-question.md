I had to find a challenge for the part that we have the google street maps, so I am trying to use the react-helmet to import javascript and css inside of the component, removing the need to having the script and link tags on the index.html.

# This solution works, but isn't what I want, I just am showing that works if I get the value from the child

## PlaceItem.js (Parent  Class)
```
import React , {useState} from 'react';

import Card from '../../shared/components/UIElements/Card'
import Modal from '../../shared/components/UIElements/Modal'
import Button from '../../shared/components/FormElements/Button'
import OpenStreetMap from '../../shared/components/UIElements/OpenStreetMap'

import {Helmet} from "react-helmet";

import './PlaceItem.css'

const PLaceItem = (props) => {

    const [showMap, setShowMap] = useState(false);
    const openMapHandler = () => setShowMap(true);
    const closeMapHandler = () => setShowMap(false);

    return (
        <React.Fragment>
            <Helmet>
                <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/css/ol.css" type="text/css" />
                <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/build/ol.js"></script>
            </Helmet>
            <Modal show={showMap} onCancel={closeMapHandler} header={props.address}
                contentClass="place-item__modal-content"
                footerClass="place-item__modal-actions"
                footer={<Button onClick={closeMapHandler}>Close</Button>}
            >
                <div className="map-container">
                    <OpenStreetMap center={props.coordinates} zoom={16}/>
                </div>
            </Modal>
            <li className="place-item">
                <Card className="place-item__content">
                    <div className="place-item__image">
                        <img src={props.image} alt={props.title} />
                    </div>
                    <div className="place-item__info">
                        <h2>{props.title}</h2>
                        <h3>{props.address}</h3>
                        <p>{props.description}</p>
                    </div>
                    <div className="place-item__actions">
                        <Button inverse onClick={openMapHandler}>View on Map</Button>
                        <Button to={`/places/${props.id}`}>Edit</Button>
                        <Button danger>Delete</Button>
                    </div>
                </Card>
            </li>
        </React.Fragment>
    );
};
export default PLaceItem;
```
## OpenStreetMap (Child Class)
```
import React, { useRef, useEffect } from 'react';

import './Map.css';

const Map = props => {
    const mapRef = useRef();

    const { center, zoom } = props;

    useEffect(() => {
        new window.ol.Map({
            target: mapRef.current.id,
            layers: [
                new window.ol.layer.Tile({
                    source: new window.ol.source.OSM()
                })
            ],
            view: new window.ol.View({
                center: window.ol.proj.fromLonLat([center.lng, center.lat]),
                zoom: zoom
            })
        });
    }, [center, zoom]);

    return (
        <React.Fragment>
            <div
                ref={mapRef}
                className={`map ${props.className}`}
                style={props.style}
                id="map"
            ></div>
        </React.Fragment>
    );
};

export default Map;
```

This code **works** as  the parent specify what is the child element to add into the header and ti does, getting the result of the map being printed into the screen.

# Why isn't a good approach?
* I am hardcoding the solution (if tomorrow I want to change to google maps, I will need to change the object as well as that react-helmet import part)

# Atempt 1: Trying to print the child value inside of the react-helmet
```
<Helmet>
    {scriptToPrint}               
</Helmet>
```

## Parent Class
### Adding a **addHeaderHandler**
```
<OpenStreetMap onAddHeader={addHeaderHandler} center={props.coordinates} zoom={16}/>
```
### Adding the arrow function **addHeaderHandler**
```
let headers = '';
const addHeaderHandler = (newHeader) => {
    headers = [...newHeader].join('');
    console.log('I can see value in here', headers);
}
```

## Child Class

## Using the onAddHeader function to trigger the populate of headers
```
const headerLink = '<link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/css/ol.css" type="text/css" />';
const headerScript = '<script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/build/ol.js"></script>'

props.onAddHeader([headerLink, headerScript]);
```

## The issue it's on the parent class render function
```
return (
        <React.Fragment>
            <Helmet>
                {/*I cant see value in here, it's always empty*/}
                {headers !== '' &&  headers}
            </Helmet>
            <Modal
                show={showMap}
                onCancel={closeMapHandler}
                header={props.address}
                contentClass="place-item__modal-content"
                footerClass="place-item__modal-actions"
                footer={<Button onClick={closeMapHandler}>Close</Button>}
            >
                <div className="map-container">
                    <OpenStreetMap onAddHeader={addHeaderHandler} center={props.coordinates} zoom={16}/>
                </div>
            </Modal>
            <li className="place-item">
                <Card className="place-item__content">
                    <div className="place-item__image">
                        <img src={props.image} alt={props.title} />
                    </div>
                    <div className="place-item__info">
                        <h2>{props.title}</h2>
                        <h3>{props.address}</h3>
                        <p>{props.description}</p>
                    </div>
                    <div className="place-item__actions">
                        <Button inverse onClick={openMapHandler}>View on Map</Button>
                        <Button to={`/places/${props.id}`}>Edit</Button>
                        <Button danger>Delete</Button>
                    </div>
                </Card>
            </li>
        </React.Fragment>
    );
```
Because the first time is empty the value, <Helmet> wont be importing the **external javascript**, so won't be calling as the way that should be in the first example:

## Should be like this
```
<Helmet>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/css/ol.css" type="text/css" />
  <script src="https://cdn.jsdelivr.net/gh/openlayers/openlayers.github.io@master/en/v6.1.1/build/ol.js"></script>
</Helmet>
```
## I am getting like this
```
<Helmet>
               
</Helmet>
```

Any ideas on this? I already spent a few hours before sending this post, so I did try to search for other solutions, and I am still stuck with it. Any help?

Thank you all!

Raf.