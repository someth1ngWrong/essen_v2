import React from 'react'
import A_Icon from './A_Icon'
import A_TextBody from './A_TextBody'

const M_TextAndIcon = ({ icon, text}) => {
  return (
    <div className="map-details-container m-icon-and-text m-text-icon-recipe">
      <A_Icon icon={icon} />
      <div className="map-detail m-text-title m-text-title-recipe">
        <A_TextBody text={text}/>
      </div>
    </div>
  )
}

export default M_TextAndIcon
