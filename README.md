# Auto Resize TableViewCell that contains UICollectionView


The idea of the POC is validate if is possible to do not define a cell hight and leave that the autoSizing do it this using `UITableView.automaticDimension` 

```
override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return UITableView.automaticDimension
}
```

|Actual|Expected|
|---|---|
|![Simulator Screen Shot - iPhone SE (2nd generation) - 2022-03-24 at 22 25 20](https://user-images.githubusercontent.com/4712149/160048581-29f21e7f-bdb4-417d-b505-8da3216078f5.png)|![Simulator Screen Shot - iPhone SE (2nd generation) - 2022-03-24 at 22 25 55](https://user-images.githubusercontent.com/4712149/160048604-6765c609-2f12-4870-8b24-59c80f031f55.png)|


## File:

**TableViewController**: Contains the `UITableView`, implements DataSource methods

**CollectionViewCellTableViewCell**: This is a `UITableViewCell` that contains the `UICollectionView` it is register the `UICollectionViewCell` and implements the `UICollectionViewDataSource`

**CollectionViewCell**: The cell that is used by the `UICollectionView`
