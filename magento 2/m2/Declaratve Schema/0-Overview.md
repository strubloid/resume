# Declarative Schema Overview

## overview
* This is a new way to create upgrade scripts
* This is a way to simplify the installation and upgrade process
* When a customer upgrades Magento to a version several releases ahead of the installed version,
the upgrade script for each intermediate release still executes.
Developers were required to fully understand what each install and upgrade script contained.
They needed to account for this complexity when creating extensions.

## Why?
* The new declarative schema approach allows developers to declare the final desired state of the database
 and has the system adjust to it automatically, without performing redundant operations.
 * Developers are no longer forced to write scripts for each new version.
 In addition, this approach allows data be deleted when a module is uninstalled.

## Possible steps to do
* Develop a data patch  and/or a schema patch
* Configure the declarative schema for your module
* Convert upgrade script to declarative schema (this is only for modules that have been released using upgrade scripts)

## When we need to upgrade scripts?
* when we have a table that will need to change a structure of it and now on 2.3 it is using declarativeschema

## Data patch Terminology

### Data patch
* It is a class that contains data modification instruction
* can have dependencies on other data or schema patches

### Revertable data patch
* A data patch contains the method revert()
* this method will provide operations to revert the changes by the module
* Revertable operations are usually related to changes in the database

### Migrations
* This is a operation type that aren't reversible
* Can have complex operations such as that contains an application layer(for example, Collection or Serializers)
* SQL delete operations are non-revertable because they can cause triggering

### Schema Patch
* This class will contain custom schema modifications instructions
* Schema patches are used along with a declarative schema
* Good examples of actions in a patch:
  * Adding triggers, store procedures and functions in a database level
  * Performing data migration with inside DDL(Data Definition Language) operations
  * Renaming tables, columns and other entities
  * Adding partitions and options to a table

## Revertable Schema patch
* This is a schema patch that contains a **revert()** function with the provided revert functionality
* Like the Revertable data patch, the revert functionality of the schema patch **affects changes in the database level only**
