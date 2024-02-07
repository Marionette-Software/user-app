// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:gql/ast.dart' as _i1;

const InitNonCustodial = _i1.OperationDefinitionNode(
  type: _i1.OperationType.mutation,
  name: _i1.NameNode(value: 'InitNonCustodial'),
  variableDefinitions: [
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'provider')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable:
          _i1.VariableNode(name: _i1.NameNode(value: 'inPaymentInterfaceId')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'inCurrencyId')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'amount')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'slippage')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'Float'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
    _i1.VariableDefinitionNode(
      variable: _i1.VariableNode(name: _i1.NameNode(value: 'recipientId')),
      type: _i1.NamedTypeNode(
        name: _i1.NameNode(value: 'String'),
        isNonNull: true,
      ),
      defaultValue: _i1.DefaultValueNode(value: null),
      directives: [],
    ),
  ],
  directives: [],
  selectionSet: _i1.SelectionSetNode(selections: [
    _i1.FieldNode(
      name: _i1.NameNode(value: 'initNonCustodialExternalExchange'),
      alias: null,
      arguments: [
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'provider'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'provider')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'inPaymentInterfaceId'),
          value: _i1.VariableNode(
              name: _i1.NameNode(value: 'inPaymentInterfaceId')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'inCurrencyId'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'inCurrencyId')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'amount'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'amount')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'slippage'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'slippage')),
        ),
        _i1.ArgumentNode(
          name: _i1.NameNode(value: 'recipientId'),
          value: _i1.VariableNode(name: _i1.NameNode(value: 'recipientId')),
        ),
      ],
      directives: [],
      selectionSet: null,
    )
  ]),
);
const document = _i1.DocumentNode(definitions: [InitNonCustodial]);
