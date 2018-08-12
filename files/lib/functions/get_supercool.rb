Puppet::Functions::create_function(:get_supercool) do
    def get_supercool(api_endpoint, api_token, cool_var)
        cmd = "curl -s -k -H \"supercool-token: #{api_token}\" -X GET #{api_endpoint}"
        resp = `#{cmd}`
        resp + cool_var
    end
end
