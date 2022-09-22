# **Useful Ansible Commands**

To test the connection with a specific host using the ping model of ansible, use the following command:

```bash 
ansible -i <ansible-inventory> -m ping <host>
```

To execute a playbook using ansible, use the following command:

```bash 
ansible-playbook -i <ansible-inventory> <ansible-playbook>
```

