import 'package:flutter/material.dart';
import 'package:products_api/src/api/products.dart';
import 'package:products_api/src/models/products.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class FormAddScreen extends StatefulWidget {
  Products products;

  FormAddScreen({this.products});

  @override
  _FormAddScreenState createState() => _FormAddScreenState();
}

class _FormAddScreenState extends State<FormAddScreen> {
  bool _isLoading = false;
  ApiProducts _apiProducts = ApiProducts();
  bool _isFieldNameValid;
  bool _isFieldCategoryValid;
  bool _isFieldColorValid;
  bool _isFieldUnitPriceValid;
  bool _isFieldAvailableQuantityValid;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerCategory = TextEditingController();
  TextEditingController _controllerColor = TextEditingController();
  TextEditingController _controllerUnitPrice = TextEditingController();
  TextEditingController _controllerAvailableQuantity = TextEditingController();

  @override
  void initState() {
    if (widget.products!= null) {
      _isFieldNameValid = true;
      _controllerName.text = widget.products.name;
      _isFieldCategoryValid = true;
      _controllerCategory.text = widget.products.category;
      _isFieldColorValid = true;
      _controllerColor.text = widget.products.color;
      _isFieldUnitPriceValid = true;
      _controllerUnitPrice.text = widget.products.unitPrice.toString();
      _isFieldAvailableQuantityValid = true;
      _controllerAvailableQuantity.text = widget.products.availableQuantity.toString();
    }
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.products == null ? "Form Add" : "Change Data",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                _buildTextFieldName(),
                _buildTextFieldCategory(),
                _buildTextFieldColor(),
                _buildTextFieldUnitPrice(),
                _buildTextFieldAvailableQuantity(),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: RaisedButton(
                    child: Text(
                      widget.products == null
                          ? "Ingresar".toUpperCase()
                          : "Actualizar".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (_isFieldNameValid == null ||
                          _isFieldCategoryValid == null ||
                          _isFieldColorValid == null ||
                          _isFieldUnitPriceValid == null ||
                          _isFieldAvailableQuantityValid == null ||
                          !_isFieldNameValid ||
                          !_isFieldCategoryValid ||
                          !_isFieldColorValid ||
                          !_isFieldUnitPriceValid ||
                          !_isFieldAvailableQuantityValid) {
                        _scaffoldState.currentState.showSnackBar(
                          SnackBar(
                            content: Text("Please fill all field"),
                          ),
                        );
                        return;
                      }
                      setState(() => _isLoading = true);
                      String name = _controllerName.text.toString();
                      String category = _controllerCategory.text.toString();
                      String color = _controllerColor.text.toString();
                      String unitPrice = _controllerUnitPrice.text.toString();
                      String availableQuantity = _controllerAvailableQuantity.text.toString();
                      Products products =
                          Products(name: name, category: category, color: color,unitPrice:unitPrice,availableQuantity:availableQuantity);
                      if (widget.products == null) {
                        _apiProducts.createProducts(products).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Submit data failed"),
                            ));
                          }
                        });
                      } else {
                        products.productId = widget.products.productId;
                        _apiProducts.updateProducts(products).then((isSuccess) {
                          setState(() => _isLoading = false);
                          if (isSuccess) {
                            Navigator.pop(_scaffoldState.currentState.context);
                          } else {
                            _scaffoldState.currentState.showSnackBar(SnackBar(
                              content: Text("Registro Actualizado"),
                            ));
                          }
                        });
                      }
                    },
                    color: Colors.orange[600],
                  ),
                )
              ],
            ),
          ),
          _isLoading
              ? Stack(
                  children: <Widget>[
                    Opacity(
                      opacity: 0.3,
                      child: ModalBarrier(
                        dismissible: false,
                        color: Colors.grey,
                      ),
                    ),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }

  Widget _buildTextFieldName() {
    return TextField(
      controller: _controllerName,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Name",
        errorText: _isFieldNameValid == null || _isFieldNameValid
            ? null
            : "Full Name is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldNameValid) {
          setState(() => _isFieldNameValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldCategory() {
    return TextField(
      controller: _controllerCategory,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Category",
        errorText: _isFieldCategoryValid == null || _isFieldCategoryValid
            ? null
            : "Full Category is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldCategoryValid) {
          setState(() => _isFieldCategoryValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldColor() {
    return TextField(
      controller: _controllerColor,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Color",
        errorText: _isFieldColorValid == null || _isFieldColorValid
            ? null
            : "Full Color is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldColorValid) {
          setState(() => _isFieldColorValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldUnitPrice() {
    return TextField(
      controller: _controllerUnitPrice,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Unit Price",
        errorText: _isFieldUnitPriceValid == null || _isFieldUnitPriceValid
            ? null
            : "Full Unit Price is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldUnitPriceValid) {
          setState(() => _isFieldUnitPriceValid = isFieldValid);
        }
      },
    );
  }

  Widget _buildTextFieldAvailableQuantity() {
    return TextField(
      controller: _controllerAvailableQuantity,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: "Full Available Quantity",
        errorText: _isFieldAvailableQuantityValid == null || _isFieldAvailableQuantityValid
            ? null
            : "Full Available Quantity is required",
      ),
      onChanged: (value) {
        bool isFieldValid = value.trim().isNotEmpty;
        if (isFieldValid != _isFieldAvailableQuantityValid) {
          setState(() => _isFieldAvailableQuantityValid = isFieldValid);
        }
      },
    );
  }

}