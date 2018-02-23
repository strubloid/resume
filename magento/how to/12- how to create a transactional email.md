# how to create a transactional email

1. go to a module that you will configure the transactional emails from
2. add the snipet into the code
```
	<template>
        <email>
            <design_email_header translate="label">
                <label>Email - Footer</label>
                <file>carrolls/header.html</file>
                <type>text</type>
            </design_email_header>
            <design_email_footer translate="label">
                <label>Email - Footer</label>
                <file>carrolls/footer.html</file>
                <type>text</type>
            </design_email_footer>
        </email>
    </template>
```

* note: change the 'carrolls' for the name of the project that you are doing the task.
