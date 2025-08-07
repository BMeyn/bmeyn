# Bjarne Meyn's Blog

[![GitHub license](https://img.shields.io/github/license/cotes2020/chirpy-starter.svg?color=blue)][mit]

Personal blog where I share knowledge, insights, and experiments with software development and technology. Built with Jekyll using the [Chirpy theme][chirpy].

## Adding New Blog Posts

To add a new blog post to this blog:

1. Create a new Markdown file in the `_posts` directory with the naming convention:
   ```
   YYYY-MM-DD-title-with-hyphens.md
   ```

2. Add the required front matter at the top of your file:
   ```yaml
   ---
   title: "Your Post Title"
   date: YYYY-MM-DD HH:MM:SS +0000
   categories: [Category1, Category2]
   tags: [tag1, tag2, tag3]
   pin: false  # set to true to pin the post
   ---
   ```

3. Write your content using Markdown syntax below the front matter.

### Example Post Structure

```markdown
---
title: "My New Blog Post"
date: 2025-01-15 14:30:00 +0000
categories: [Development, Tools]
tags: [jekyll, blogging, markdown]
pin: false
---

## Introduction

Your blog content goes here...
```

## Local Development

### Prerequisites

- Ruby (3.0 or higher)
- Bundler gem

### Running the Blog Locally

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Start the development server:
   ```bash
   bash tools/run.sh
   ```
   
   Or use the Jekyll command directly:
   ```bash
   bundle exec jekyll serve --livereload
   ```

3. Open your browser and navigate to `http://127.0.0.1:4000`

The site will automatically reload when you make changes to your posts or configuration.

## Testing

To test the blog for broken links and HTML validation:

```bash
bash tools/test.sh
```

## Project Structure

```
.
├── _posts/          # Blog posts (Markdown files)
├── _tabs/           # Navigation tabs (About, Archives, Categories, Tags)
├── _config.yml      # Site configuration
├── assets/          # Images, stylesheets, and other assets
├── tools/           # Build and test scripts
├── Gemfile          # Ruby dependencies
└── README.md        # This file
```

## Customization

For advanced theme customization and configuration options, check out the [Chirpy theme documentation][chirpy].

## License

This work is published under [MIT][mit] License.

[chirpy]: https://github.com/cotes2020/jekyll-theme-chirpy/
[mit]: https://github.com/cotes2020/chirpy-starter/blob/master/LICENSE