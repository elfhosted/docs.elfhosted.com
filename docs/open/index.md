# ElfHosted is Open Source

Our technical resources are open-source, and available for public inspection and input.

Part of the reason ElfHosted exists is to provide a "reference design" for similar platforms. If you want help doing something like this, [hit me up](https://www.funkypenguin.co.nz/work-with-me/) - it's my DayJob(tm)!

## Reports

Each month's progress reports and metrics are summarized in the left-hand navigation column, and are listed below:

* [Jun 2025](/open/jun-2025/)
* [May 2025](/open/may-2025/)
* [Apr 2025](/open/apr-2025/)
* [Mar 2025](/open/mar-2025/)
* [Feb 2025](/open/feb-2025/)
* [Jan 2025](/open/jan-2025/)
* [Dec 2024](/open/dec-2024/)
* [Nov 2024](/open/nov-2024/)
* [Oct 2024](/open/oct-2024/)
* [Sep 2024](/open/sep-2024/)
* [Aug 2024](/open/aug-2024/)
* [Jul 2024](/open/jul-2024/)
* [Jun 2024](/open/jun-2024/)
* [May 2024](/open/may-2024/)
* [Apr 2024](/open/apr-2024/)
* [Mar 2024](/open/mar-2024/)
* [Feb 2024](/open/feb-2024/)
* [Jan 2024](/open/jan-2024/)
* [Dec 2023](/open/dec-2023/)
* [Nov 2023](/open/nov-2023/)
* [Oct 2023](/open/oct-2023/)
* [Sept 2023](/open/september-2023/)
* [Aug 2023](/open/august-2023/)
* [July 2023](/open/july-2023/)
* [June 2023](/open/june-2023/)

## Technical

### Repositories

#### :simple-github: [elfhosted/containers](https://github.com/elfhosted/containers) 

Contains the containers we run ([available at ghcr.io](https://github.com/orgs/elfhosted/packages)), with a build process inspired by https://github.com/onedr0p/containers/

[![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/w/elfhosted/containers/main)
![GitHub Repo stars](https://img.shields.io/github/stars/elfhosted/containers)](https://github.com/elfhosted/containers)
 
#### :simple-github: [geek-cookbook/elf-infra](https://github.com/elfhosted/infra)

Contains the flux GitOps manifests used to run various services on the cluster, as well as the ansible playbooks / roles to maintain these.

[![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/w/elfhosted/infra/main)
![GitHub Repo stars](https://img.shields.io/github/stars/elfhosted/infra)](https://github.com/elfhosted/infra)

#### :simple-github: [geek-cookbook/myprecious](https://github.com/elfhosted/myprecious)

Contains the charts we use to provide apps, under a single umbrella chart "myprecious". Heavily inspired by https://github.com/k8s-at-home/charts, which I've since forked to https://github.com/elfhosted/charts, and continue to maintain

[![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/w/elfhosted/myprecious/main)
![GitHub Repo stars](https://img.shields.io/github/stars/elfhosted/myprecious)](https://github.com/elfhosted/myprecious)

#### :simple-github: [geek-cookbook/elfhosted.com](https://github.com/elfhosted/elfhosted.com)

Contains source used for https://elfhosted.com, and is built with mkdocs-material on Netlify

[![GitHub commit activity (branch)](https://img.shields.io/github/commit-activity/w/elfhosted/elfhosted.com/main)
![GitHub Repo stars](https://img.shields.io/github/stars/elfhosted/elfhosted.com)](https://github.com/elfhosted/elfhosted.com)

!!! question "What's missing?"
    Ha. Good question. What's **not** public is the repo which houses our user configs (*each user's particular combination of helm charts and values*), for obvious reasons, and all the secrets etc which make the magic work.