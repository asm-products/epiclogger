@Error = React.createClass(
  propTypes:
    description: React.PropTypes.string
    website: React.PropTypes.instanceOf(@Website)

  render: ()->
    <div>
        <div>Description: {this.props.description}</div>
        <div>Website: {this.props.website}</div>
    </div>
)
