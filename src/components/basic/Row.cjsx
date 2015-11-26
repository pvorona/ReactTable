React = require 'react'
Td = require './Td.cjsx'

module.exports = React.createClass
	onClick: (i) ->
		newIsEditing = @state.isEditing
		newIsEditing[i] = not newIsEditing[i]
		@setState({isEditing: newIsEditing})

	onChange: (i, event) ->
		newValues = @state.values
		newValues[i] = event.target.value
		@setState({values: newValues})

	getInitialState: ->
		values: @props.children
		isEditing: @props.children.map(-> false)

	elements: ->
		@props.children.map((child, i) =>
			<Td key={i} isEditing={@state.isEditing[i]}
									onClick={@onClick.bind(this, i)}
									onChange={@onChange.bind(this, i)}
									value={@state.values[i]}/>)

	render: ->
		<tr>{@elements()}</tr>