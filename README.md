# vCenter Simulator (VCSIM) Continuous Integration (CI)

> Have you ever wanted to test against VMware vCenter, but didn't have a lab environment available? How about in an automated fashion, every time you commit new code?

VMware's Go SDK [govmomi] includes [govcsim], a vCenter simulator that mocks APIs. 

In my first blog post on this topic, [vCenter Simulator Docker Container], I wrote about a [VCSIM] Docker container that allows an even more portable option.

A follow-up blog post, **[vCenter Simulator CI Pipeline]**, explains this repository in detail.

> This walkthrough uses [PowerCLI] and [Azure Pipelines], but you could apply these concepts to any vSphere code (e.g. pyvmomi/govmomi) and any CI pipeline provider (e.g. GitLab/AppVeyor).



[govmomi]: https://github.com/vmware/govmomi
[govcsim]: https://github.com/vmware/govmomi/tree/master/vcsim

[vCenter Simulator Docker Container]: /blog/2018/12/31/vcenter-simulator-ci/
[VCSIM]: https://hub.docker.com/r/nimmis/vcsim

[vCenter Simulator CI Pipeline]: /blog/2019/09/24/vcenter-simulator-ci-2/

[PowerCLI]: https://www.powershellgallery.com/packages/VMware.PowerCLI
[Azure Pipelines]: https://azure.microsoft.com/en-us/services/devops/pipelines/
