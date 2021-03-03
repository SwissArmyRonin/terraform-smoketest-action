# terraform-smoketest-action

A GitHub action for running a smoketest on Terraform modules.

To use in a GitHub action, add something like the following to your action:

```yaml
name: smoketest
on: [push]
jobs:
  smoketest:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Cache Terraform modules
        uses: actions/cache@v2
        env:
          cache-name: cache-terraform
        with:
          path: .terraform
          key: ${{ runner.os }}-build-${{ env.cache-name }}-${{ hashFiles('**/.terraform.lock.hcl') }}
          restore-keys: |
            ${{ runner.os }}-build-${{ env.cache-name }}-
            ${{ runner.os }}-build-
            ${{ runner.os }}-
      - name: Run smoketest
        uses: SwissArmyRonin/terraform-smoketest-action@v4
        with:
          aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws_default_region: ${{ secrets.AWS_DEFAULT_REGION }}
```

There must be secrets for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`, but if `AWS_DEFAULT_REGION`is unspecified, it defaults to `eu-west-1`.
