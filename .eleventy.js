module.exports = function (eleventyConfig) {
  // Output directory: _site

  // Copy `img/` to `_site/img`
  eleventyConfig.addPassthroughCopy("img");
  eleventyConfig.addPassthroughCopy({"fonts": "static/fonts"});

  eleventyConfig.addPassthroughCopy({
    "node_modules/normalize.css/": "static/css/normalize.css/",
  });
  eleventyConfig.addPassthroughCopy({
    "node_modules/milligram/dist": "static/css/milligram",
  });
  eleventyConfig.addPassthroughCopy({
    "_scss/dist": "static/css/",
  });
  eleventyConfig.addPassthroughCopy({
    "AN-CV-2021.pdf": "static/files/AN-CV-2021.pdf",
  });
  eleventyConfig.addPassthroughCopy({
    _js: "static/js/",
  });
};
