## 課題

### 手順

1. CircleCIのアカウント作成
1. CircleCI上でプロジェクトを作成し、対象のGitHubリポジトリを登録
1. .circleci/config.yml の作成

    ``` yaml
    version: 2.1
    orbs:
      python: circleci/python@2.0.3
    jobs:
      cfn-lint:
        executor: python/default
        steps:
          - checkout
          - run: pip install cfn-lint
          - run:
              name: run cfn-lint
              command: |
                # CloudFormationテンプレートファイルの検証
                cfn-lint -i W3002 -t lecture10.yaml

    workflows:
      raisetech:
        jobs:
          - cfn-lint
    ```

1. GitHubへPush

### 実行結果

![](img/lec12/1-1.png)

---

## 学んだこと

- CircleCIの使い方

## 感想

- CircleCIはJenkinsに比べてサーバーの管理が不要な点で便利だと感じた。

