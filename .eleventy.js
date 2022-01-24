module.exports = function (eleventyConfig) {
  // Output directory: _site

  // Copy `img/` to `_site/img`
  eleventyConfig.addPassthroughCopy("img");

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
    _js: "static/js/",
  });
};
