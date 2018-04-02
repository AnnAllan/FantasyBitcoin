import React from 'react';
import { withStyles } from 'material-ui/styles';
import Input, { InputLabel } from 'material-ui/Input';
import { MenuItem } from 'material-ui/Menu';
import { FormControl, FormHelperText } from 'material-ui/Form';
import Select from 'material-ui/Select';

const styles = theme => ({
  root: {
    textAlign: 'right', 
  },
  formControl: {
    margin: theme.spacing.unit,
    minWidth: 160,
  },
  selectEmpty: {
    marginTop: theme.spacing.unit * 2,
  },
  input: {
    fontSize: 15
  },
  selectMenu: {
    fontSize: 13
  }
});

let DisplayCurrencySelect = (
  {classes, displayCurrency, onDisplayCurrencyChange, govDisplayCurrency, cryptoDisplayCurrency}
) => {
  return (
    <form className={classes.root} autoComplete="off">
      <FormControl className={classes.formControl}>
        <InputLabel className={classes.input} htmlFor="display-currency">
          Choose {govDisplayCurrency} or {cryptoDisplayCurrency}
        </InputLabel>
        <Select className={classes.selectMenu}
          value={displayCurrency || ''}
          onChange={onDisplayCurrencyChange}
          inputProps={{
            name: 'displayCurrency',
            id: 'displayCurrency',
          }}
        >
          
          <MenuItem className={classes.selectMenu} value={govDisplayCurrency}>{govDisplayCurrency}</MenuItem>
          <MenuItem className={classes.selectMenu} value={cryptoDisplayCurrency}>{cryptoDisplayCurrency}</MenuItem>
        </Select>
      </FormControl>
    </form>
  );
};

DisplayCurrencySelect = withStyles(styles, { withTheme: true })(DisplayCurrencySelect);

export default DisplayCurrencySelect;