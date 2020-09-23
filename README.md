# DigitalOcean Spaces Sync
GitHub Action to sync content into repository-specific directory within a DigitalOcean Space, while respecting directory structure. 

## Usage/Configuration

Setup a workflow YML file for this task (`.github/workflows/<name_this>.yml`). [Check out GitHub's workflow syntax documentation](https://docs.github.com/en/actions/reference/workflow-syntax-for-github-actions). 

Here is an example workflow file:

```yaml
name: CDN Deployment
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: nebula-dev/spaces-sync-action@master
      env:
        SOURCE_DIR: './static/'
        SPACE_REGION: 'sfo2'
        SPACE_NAME: ${{ secrets.SPACE_NAME }}
        SPACE_ACCESS_KEY: ${{ secrets.SPACE_ACCESS_KEY }}
        SPACE_SECRET_KEY: ${{ secrets.SPACE_SECRET_KEY }}
```

**Setup the access and secret keys as [encrypted secrets, either for your repository or organization.](https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables)** You can also do this for the space name, as in the example above.
