@Member = React.createClass(
  propTypes:
    email: React.PropTypes.string
    name: React.PropTypes.string

  render: ()->
    <div>
      <div>Email: {this.props.email}</div>
      <div>Name: {this.props.name}</div>
    </div>
)
