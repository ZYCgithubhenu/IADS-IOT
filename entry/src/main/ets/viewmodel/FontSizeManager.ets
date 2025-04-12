export class FontSizeManager {
  private static instance: FontSizeManager = new FontSizeManager()
  private currentScale: number = 1.0

  private constructor() {}

  public static getInstance(): FontSizeManager {
    return FontSizeManager.instance;
  }

  public getScale(): number {
    return this.currentScale
  }

  public setScale(scale: number): void {
    this.currentScale = Math.min(Math.max(scale, 0.8), 1.5)
  }
}