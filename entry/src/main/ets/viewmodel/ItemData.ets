export default class ItemData {
  /**
   * ID of list item.
   */
  id: number;
  /**
   * Text of list item.
   */
  title: ResourceStr;
  /**
   * Image of list item.
   */
  img: Resource;
  /**
   * Other resource of list item.
   */
  others?: ResourceStr;

  constructor(id: number, title: ResourceStr, img: Resource, others?: ResourceStr) {
    this.id = id;
    this.title = title;
    this.img = img;
    this.others = others;
  }
}