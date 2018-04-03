import React from 'react';
import { ListItem, ListItemIcon, ListItemText } from 'material-ui/List';
import AccountBalanceWalletIcon from 'material-ui-icons/AccountBalanceWallet';
import MonetizationOnIcon from 'material-ui-icons/MonetizationOn';
import CompareArrowsIcon from 'material-ui-icons/CompareArrows';
import { NavLink } from 'react-router-dom';


export const NavigationLinks = (
  <div>
    <NavLink to='/portfolio'>
      <ListItem button>
        <ListItemIcon>
          <AccountBalanceWalletIcon />
        </ListItemIcon>
        <ListItemText primary="Portfolio" />
      </ListItem>
    </NavLink>
    <NavLink to='/coins'>
      <ListItem button>
        <ListItemIcon>
          <MonetizationOnIcon />
        </ListItemIcon>
        <ListItemText primary="Coins" />
      </ListItem>
    </NavLink>
    <NavLink to='/transactions'>
      <ListItem button>
        <ListItemIcon>
          <CompareArrowsIcon />
        </ListItemIcon>
        <ListItemText primary="Transactions" />
      </ListItem>
    </NavLink>
  </div>
);
