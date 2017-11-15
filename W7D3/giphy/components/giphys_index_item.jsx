import React from 'react';

const GiphysIndexItem = function({giphy}) {
  return (
    <li>
      <img src={giphy.images.fixed_height.url} />
    </li>
  );
}

export default GiphysIndexItem;
