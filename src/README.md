# ABAP Cloud Global Sales Data Model (abapGit package)

This package provides Cloud-ready CDS tables, a loader class and CDS views for realistic global sales demo data.

## How to use

1. Create a package in your ABAP Cloud system (example: ZSLS_CLOUD).
2. Install / open abapGit in Eclipse (ADT) and add a new repository pointing to this repo.
3. Pull into your package and activate all objects.
4. Run class ZCL_LOAD_GLOBAL_SALES (Right-click -> Run As -> ABAP Application (Console)).
5. Open Data Preview on ZV_SALES_OVERVIEW and ZV_SALES_AGGR.

Notes:
- Adjust load counts in the class if you want more data.
- If your system does not support to_varchar with format in CDS, replace usage with substring-based year-month extraction.
