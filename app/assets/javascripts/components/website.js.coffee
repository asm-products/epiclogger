@Website = React.createClass(
  propTypes:
    title: React.PropTypes.string
    domain: React.PropTypes.string
    member: React.PropTypes.instanceOf(@Member)

  render: ()->
    <div>
      <div>Title: {this.props.title}</div>
      <div>Domain: {this.props.domain}</div>
      <div>Member: {this.props.member}</div>
    </div>
)
