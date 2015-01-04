package maybe;

import haxe.macro.Expr;

class Extract
{
	public static function build()
	{
		return haxe.macro.Context.getBuildFields().map(transformField);
	}
 
	static function transformField(field:Field)
	{
		switch (field.kind)
		{
			case FFun(f): transformExpr(f.expr);
			default:
		}
		return field;
	}
 
	static function transformExpr(expr:Expr) switch (expr)
	{
		case macro @extract($variable => $set) $block:

			switch(block.expr) {
				case EBlock(inner): {
					if (inner.length != 2 || inner[0].expr.getName() != "EBlock" || inner[1].expr.getName() != "EBlock") {
						trace("HERE " + set);
						transformExpr(block);
						expr.expr = makeIf(variable, set, block).expr;
						return;
					}

					trace("DUAL " + set);
					transformExpr(inner[0]);
					transformExpr(inner[1]);

					expr.expr = makeIfElse(variable, set, inner[0], inner[1]).expr;
				}
				default: {	
					trace("DEF " + set);
					transformExpr(block);
					expr.expr = makeIf(variable, set, block).expr;
				}
			}
		default:
			haxe.macro.ExprTools.iter(expr, transformExpr);
	}
 	
	static function makeIf<T>(variable:ExprOf<Maybe<T>>, set:Expr, block:Expr) {

		var var_name : String;

		switch(set.expr) {
			case EConst(c): {
				switch(c) {
					case CIdent(s):
						var_name = s;
					default: {
						throw "Variable name in @extract must be an identifier not an " + c;
					}
				}
			}
			default: {
				throw "Variable name in @extract must be an identifier not an " + set.expr;
			}
		}

		return macro
		{
			var tmp = $variable;
			if (tmp != null) {
				var $var_name = tmp.extract();
				$block;
			}
		}
	}

	static function makeIfElse<T>(variable:ExprOf<Maybe<T>>, set:Expr, block:Expr, block2:Expr) {

		var var_name : String;

		switch(set.expr) {
			case EConst(c): {
				switch(c) {
					case CIdent(s):
						var_name = s;
					default: {
						throw "Variable name in @extract must be an identifier not an " + c;
					}
				}
			}
			default: {
				throw "Variable name in @extract must be an identifier not an " + set.expr;
			}
		}

		return macro
		{
			var tmp = $variable;
			if (tmp != null) {
				var $var_name = tmp.extract();
				$block;
			} else {
				$block2;
			}
		}
	}
}