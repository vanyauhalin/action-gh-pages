# Publish GitHub Pages

This GitHub Action publishes a directory content to the `gh-pages` branch.

## Usage

Before using this action, please ensure that you have the `gh-pages` branch in your repository. If it is not present, you can create it by running the following command:

```sh
$ git switch --orphan gh-pages
$ git commit --allow-empty --message "initialize the gh-pages branch"
$ git push --set-upstream origin gh-pages
```

Once you have created the `gh-pages` branch, you can add this action to your workflow:

```yml
- name: Setup GitHub Actions Bot
  uses: vanyauhalin/action-gh-bot@v0

- name: Publish GitHub Pages
  uses: vanyauhalin/action-gh-pages@v0
  with:
    # Directory from which to publish.
    # Default: ./
    working-directory:

    # Branch to publish changes to.
    # Default: gh-pages
    branch:

    # Number of commits to keep. Set to 0 to keep all commits.
    # Default: 3
    keep:
```

## Motivation

There are dozens, if not hundreds, of ready-to-use solutions that address this problem. However, for me, they mostly seemed very complex in their implementations and had a large number of options. This was too much for me, as I just wanted to move the contents of a directory from one branch to another.

By the way, this action is not specifically linked to the GitHub Pages concept. It can be used in other scenarios where there is a need to publish some results in a separate branch. The association with GitHub Pages exists only because it is one of the most frequent use cases of this action.

## License

[MIT] (c) [Ivan Uhalin]

<!-- Footnotes -->

[Ivan Uhalin]: https://github.com/vanyauhalin/
[MIT]: https://github.com/vanyauhalin/action-gh-bot/blob/main/LICENSE.txt/
