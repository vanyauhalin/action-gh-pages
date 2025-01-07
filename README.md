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
    working-directory: # Directory from which to publish, ./ be default.
    branch: # Branch to publish changes to, gh-pages be default.
    check: # Check if the branch is up-to-date, true by default.
    reset: # Reset the branch before publishing, true by default.
```

## Motivation

There are dozens, if not hundreds, of ready-to-use solutions that address this problem. However, for me, they mostly seemed very complex in their implementations and had a large number of options. This was too much for me, as I just wanted to move the contents of a directory from one branch to another.

By the way, this action is not specifically linked to the GitHub Pages concept. It can be used in other scenarios where there is a need to publish some results in a separate branch. The association with GitHub Pages exists only because it is one of the most frequent use cases of this action.

## Showcases

[vanyauhalin/eslint-config] [`publish.yml`][vanyauhalin/eslint-config/publish.yml] [`gh-pages`][vanyauhalin/eslint-config/gh-pages] \
vanyauhalin's ESLint config.

[vanyauhalin/moondusttheme-website] [`publish.yml`][vanyauhalin/moondusttheme-website/publish.yml] [`gh-pages`][vanyauhalin/moondusttheme-website/gh-pages] \
Website to showcase all the beauty of Moondust Theme.

## License

[MIT] (c) [Ivan Uhalin]

<!-- Footnotes -->

[vanyauhalin/eslint-config]: https://github.com/vanyauhalin/eslint-config/
[vanyauhalin/eslint-config/publish.yml]: https://github.com/vanyauhalin/eslint-config/blob/main/.github/workflows/publish.yml/
[vanyauhalin/eslint-config/gh-pages]: https://github.com/vanyauhalin/eslint-config/tree/gh-pages/

[vanyauhalin/moondusttheme-website]: https://github.com/vanyauhalin/moondusttheme-website/
[vanyauhalin/moondusttheme-website/publish.yml]: https://github.com/vanyauhalin/moondusttheme-website/blob/main/.github/workflows/publish.yml/
[vanyauhalin/moondusttheme-website/gh-pages]: https://github.com/vanyauhalin/moondusttheme-website/tree/gh-pages/

[Ivan Uhalin]: https://github.com/vanyauhalin/
[MIT]: https://github.com/vanyauhalin/action-gh-bot/blob/main/LICENSE.txt/
