import _ from "loadsh";

export function paginate(items, pageNumber, pageSize) {
  const startIndex = (pageNumber-1) * pageSize;
  return _(items).slice(startIndex).take(pageSize).value();
  // Note: _(items) - returns a loadsh object so we can chain all loadsh calls
}
