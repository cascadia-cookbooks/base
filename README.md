# base Cookbook
Base OS packages

## Requirements
### Platforms
- Ubuntu '>= 12.04'
- Debian '>= 7.0'
- Rhel '>= 6.0'

### Chef
- Chef '>= 12.5'

### Cookbooks
- apt
- cop_ntp

## Packages
1. build-essentials
2. apt
3. htop
4. vim
5. nano

## Attributes
* `node['packages']['install']` = array of packages to install.

## Usage
Here's an example `base` role that will install basic OS packages. This example adds the net-tools package.

```ruby
name 'base'
description 'install base OS packages'

override_attributes(
    'packages' => {
        'install' => {
            'net-tools'
        }
    }
)

run_list(
    'recipe[cop_base::default]'
)
```

## Testing
* http://kitchen.ci
* http://serverspec.org

Testing is handled with ServerSpec, via Test Kitchen, which uses Docker to spin up VMs.

ServerSpec and Test Kitchen are bundled in the ChefDK package.

### Running
Get a listing of your instances with:

```bash
$ kitchen list
```

Run Chef on an instance, in this case default-ubuntu-1204, with:

```bash
$ kitchen converge default-ubuntu-1204
```

Destroy all instances with:

```bash
$ kitchen destroy
```

Run through and test all the instances in serial by running:

```bash
$ kitchen test
```
