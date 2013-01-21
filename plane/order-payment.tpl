

{if !$opc}
	<script type="text/javascript">
	// <![CDATA[
	var currencySign = '{$currencySign|html_entity_decode:2:"UTF-8"}';
	var currencyRate = '{$currencyRate|floatval}';
	var currencyFormat = '{$currencyFormat|intval}';
	var currencyBlank = '{$currencyBlank|intval}';
	var txtProduct = "{l s='product'}";
	var txtProducts = "{l s='products'}";
	// ]]>
	</script>

	{capture name=path}{l s='Your payment method'}{/capture}
	{include file="$tpl_dir./breadcrumb.tpl"}
{/if}

{if !$opc}<h1>{l s='Choose your payment method'}</h1>{else}<h2>3. {l s='Choose your payment method'}</h2>{/if}

{if !$opc}
	{assign var='current_step' value='payment'}
	{include file="$tpl_dir./order-steps.tpl"}

	{include file="$tpl_dir./errors.tpl"}
{else}
	<div id="opc_payment_methods" class="span12 opc-main-block">
		<div id="opc_payment_methods-overlay" class="opc-overlay" style="display: none;"></div>
{/if}

<div id="HOOK_TOP_PAYMENT">{$HOOK_TOP_PAYMENT}</div>

{if $HOOK_PAYMENT}
	{if !$opc}<h4>{l s='Please select your preferred payment method to pay the amount of'}&nbsp;<span class="price">{convertPrice price=$total_price}</span> {if $taxes_enabled}{l s='(tax incl.)'}{/if}</h4><br />{/if}
	{if $opc}<div id="opc_payment_methods-content">{/if}
		<div id="HOOK_PAYMENT">{$HOOK_PAYMENT}</div>
	{if $opc}</div>{/if}
{else}
	<p class="warning">{l s='No payment modules have been installed.'}</p>
{/if}

{if !$opc}
	<p class="cart_navigation"><a href="{$link->getPageLink('order.php', true)}?step=2" title="{l s='Previous'}" class="button">&laquo; {l s='Previous'}</a></p>
{else}
	</div>
{/if}

