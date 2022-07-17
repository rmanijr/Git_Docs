Windows Patching management with application stop / start.
==========================================================

Asset Name
---------
This playbook is designed for Security Patch management on windows platform with SAP Application and Database stop / start. 

Description
------------

This playbooks is developed for Windows security patch management with application & DB stop / start tasks. 

SAP and Database will be self discovered by the playbook and take actions of application & DB stop / start, this will help the team reduce the manual effort and time spent in every month patching activities.

Requirements
------------

Windows Software Update service (WSUS)

Variables
--------------
    list_hosts: list of target client hosts
    wsus_group: name of work group to which client host should report back the status, it is optional
    wsus_server: name of wsus server to point client hosts, optional in case update settoing are already configured
    update_operation: option to choose among Search, Download or Install
    if_reboot: Option to reboot
    wu_disable: Option to disble windows service after patching
    pre_config: option to configured the WSUS settings via registry
    app_stop_start: option to stop / start the SAP and Database


Dependencies
------------

apar-pre-checks-win
apar-post-checks-win
start-mssql-win
start-oradb-win
start-sap-win
stop-mssql-win
stop-oradb-win
stop-sap-win
update_config
update_download
update_install
update_search


Author Information
------------------

Sureshkumar Krishnamurthy
sureshkk@in.ibm.com / sureshkk@kyndryl.com
