unit Report13;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseForm, DB, ADODB, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls;

type
  TfrmReport13 = class(TfrmBaseForm)
    aqQueryINV_PART_NUMBER: TStringField;
    aqQueryINV_PART_DESCRIPTION: TStringField;
    aqQueryUNIT_NAME: TStringField;
    aqQueryGROUP_DESC: TStringField;
    aqQueryinv_group_desc: TStringField;
    aqQueryABBR_NAME: TStringField;
    aqQueryoldprice: TBCDField;
    aqQueryprice: TBCDField;
    aqQueryQUANTITY: TFloatField;
    aqQueryud_price: TBCDField;
    aqQueryud_amount: TBCDField;
    aqQueryud_price_percent: TStringField;
    aqQueryud_amount_percent: TStringField;
    aqQueryFacName: TStringField;
    aqQuerypo_emplname: TStringField;
    aqQueryship_DATE: TDateTimeField;
    aqQueryPO_NUMBER: TStringField;
    aqQueryAmount: TFloatField;
    procedure edtFilterChange(Sender: TObject);
    procedure btnQueryClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReport13: TfrmReport13;

implementation

uses condition;

{$R *.dfm}

procedure TfrmReport13.edtFilterChange(Sender: TObject);
begin
  inherited;
  //此处不能删除,否则不触发父窗体的edtFilterChange
end;

procedure TfrmReport13.btnQueryClick(Sender: TObject);
var
  i:byte;
  vCondition: widestring;
  gCondition: WideString;
begin
  inherited;
  with frmCondition do
  begin
    dtpk1.Date:= Now-7;
    dtpk2.Date:= Now;
    dtpk3.Date:= EncodeDate(CurrentYear-1, 1, 1);
    dtpk4.Date:= EncodeDate(CurrentYear, 1, 1)-1;
    if ShowModal = mrok then
    begin
      with aqQuery do
      begin
        Close;
        Parameters[0].Value:= frmCondition.Link;
        for i:=1 to sgrid1.RowCount-2 do
        if  (sgrid1.Cells[0,i] = '现供应商')and(rg1.ItemIndex =1) then
        begin
          sgrid1.Cells[3,i] := '';
        end;
        for i:= 1 to frmCondition.SGrid1.RowCount - 2 do
        begin
          vCondition:= vCondition + frmCondition.SGrid1.Cells[2,i] + #13;
          gCondition:= gCondition + frmCondition.SGrid1.Cells[3,i] + #13;
        end;

        Parameters[1].Value:='and d456.ship_DATE Between '''+formatdatetime('yyyy-mm-dd ',dtpk3.Date)+formatdatetime('hh:nn:ss',dtpk3_3.Time)+
                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk4.Date)+formatdatetime('hh:nn:ss',dtpk4_4.Time)+''''+char(13)+gCondition;
        Parameters[2].Value:= 'and t456.ship_DATE Between '''+formatdatetime('yyyy-mm-dd ',dtpk1.Date)+formatdatetime('hh:nn:ss',dtpk1_1.Time)+
                              ''' and '''+formatdatetime('yyyy-mm-dd ',dtpk2.Date)+formatdatetime('hh:nn:ss',dtpk2_2.Time)+''''+char(13)+vCondition;
        Parameters[3].Value:= 'Order By t17.INV_PART_NUMBER' + #13;
        Parameters[4].Value:= frmCondition.AreaName;
        if rg1.ItemIndex=0 then
        begin
          Parameters[5].Value := 0;
        end
        else
        begin
          Parameters[5].Value := 1;
        end;
        case rg2.ItemIndex of
          0:begin
              if CheckBox1.Checked then
              Parameters[6].Value := ' and  (CAST(ROUND(t22.tax_price * t456.exch_rate, 2) - g1.oldprice AS decimal(10, 2)) <> 0)';

            end;
          1:begin
              if CheckBox1.Checked then
                Parameters[6].Value := ' and  (CAST(ROUND(t22.tax_price * t456.exch_rate, 2) - g1.oldprice AS decimal(10, 2)) < 0)'
              else
                Parameters[6].Value := ' and  (CAST(ROUND(t22.tax_price * t456.exch_rate, 2) - g1.oldprice AS decimal(10, 2)) <= 0)';
            end;
          2:begin
              if CheckBox1.Checked then
                Parameters[6].Value :=' and  (CAST(ROUND(t22.tax_price * dbo.t456.exch_rate, 2) - g1.oldprice AS decimal(10, 2)) > 0)'
              else
                Parameters[6].Value :=' and  (CAST(ROUND(t22.tax_price * dbo.t456.exch_rate, 2) - g1.oldprice AS decimal(10, 2)) >= 0)';
            end;
        end;
        Open;
      end;
    end;
  end;
end;

end.
