# library/my_module.py

from ansible.module_utils.basic import AnsibleModule

def main():
    fields = {
        "cmd": {"required": True, "type": "str"}
    }
    module = AnsibleModule(argument_spec=fields)
    cmd = module.params["cmd"]
    rc, stdout, stderr = module.run_command(cmd)
    module.exit_json(changed=False, ansible_facts=dict(cmd=stdout))

if __name__ == "__main__":
  main()
