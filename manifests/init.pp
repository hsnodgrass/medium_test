# win_supercool/manifests/init.pp
class medium_test {
    include stdlib 
    include chocolatey
    package { '7zip.install': 
        ensure   => installed,
        provider => 'chocolatey',
    }
    exec { 'SweetPowerShell':
        command  => 'Get-Location',
        provider => 'powershell', 
    }
    registry_value { 'HKLM\SOFTWARE\supercool':
        ensure => present,
        type   => string,
        data   => 'Unit testing Puppet modules has value!',
    } 
    $var = get_supercool(lookup(function_param_1), lookup(function_param_2), 'Vengevine')
}