import React from "react"
import styles from './Section.module'
import Item from './Item';

class Section extends React.Component {
  constructor (props) {
    super(props)

    this.state = {
      title: props.title,
      inEditMode: props.inEditMode,
      items: props.items,
    }

    this.onNewItemBtnClick = this.onNewItemBtnClick.bind(this)
  }

  onNewItemBtnClick(event) {
    event.preventDefault()
    alert('show new item form')
  }

  componentDidMount() {
    $('[data-toggle="tooltip"]').tooltip()
  }

  componentDidUpdate() {
    $('[data-toggle="tooltip"]').tooltip()
  }

  render() {
    const items =
      this.state.items.map((item) =>
        <Item key={item.id} title={item.title} url={item.url} description={item.description} />
      )

    let newItemBtn
    if (this.state.inEditMode) {
      newItemBtn =
        <a onClick={this.onNewItemBtnClick} data-toggle="tooltip" title="?">
          <i className="fas fa-plus"></i>
        </a>
    }

    return (
      <div className={styles.section}>
        <h5>{this.state.title}</h5>
        {items}
        {newItemBtn}
      </div>
    )
  }
}

export default Section
