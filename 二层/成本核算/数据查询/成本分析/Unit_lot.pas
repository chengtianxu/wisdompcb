unit Unit_lot;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, Buttons, Menus, ExtCtrls, DBGridEh,
  ADODB;

type
  TForm_lot = class(TForm)
    DataSource1: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    DBGridEh1: TDBGridEh;
    N4: TMenuItem;
    ADO410_16: TADODataSet;
    ADO410_16FM_DATE: TDateTimeField;
    ADO410_16END_DATE: TDateTimeField;
    ADO410_16ACTUAL_FM_DATE: TDateTimeField;
    ADO410_16ACTUAL_END_DATE: TDateTimeField;
    ADO410_16DEPT_NAME: TStringField;
    ADO410_16STEP: TIntegerField;
    ADO410_16QTY: TIntegerField;
    ADO410_16matl_pcs: TFloatField;
    ADO410_16ovhd_pcs: TFloatField;
    ADO410_16ovhd1_pcs: TFloatField;
    ADO410_16outsource_pcs: TFloatField;
    ADO410_16BOM_PTR: TIntegerField;
    ADO410_16DEPT_PTR: TIntegerField;
    ADO410_16RKEY: TIntegerField;
    ADO410_16bring_matl_pcs: TFloatField;
    ADO410_16bring_ovhd_pcs: TFloatField;
    ADO410_16bring_ovhd1_pcs: TFloatField;
    ADO410_16bring_outsource_pcs: TFloatField;
    ADO410_16reky06: TIntegerField;
    ADO410_16CUT_NO: TStringField;
    ADO410_16PcspereEar: TFloatField;
    ADO410_16warehouse_ptr: TIntegerField;
    ADO410_16ABBR_NAME: TStringField;
    ADO410_16sc_type: TStringField;
    ADO410_16std_sqrt_cost: TFloatField;
    ADO410_16unit_sq: TFloatField;
    BitBtn2: TBitBtn;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
  private
    vvttype1:integer;
    function Getvttype1: integer;
    procedure Setvttype1(const Value: integer);
    { Private declarations }
  public
    { Public declarations }
    property vttype1:integer read Getvttype1 write Setvttype1;
  end;

var
  Form_lot: TForm_lot;

implementation

 uses Unit_lotmb1,Unit_lotmb2,Unit_lotmb3, lining_cost, uMD,common;

{$R *.dfm}

procedure TForm_lot.BitBtn1Click(Sender: TObject);
begin
  ModalResult := mrOK;
end;

function TForm_lot.Getvttype1: integer;
begin
  result:=vvttype1;
end;

procedure TForm_lot.Setvttype1(const Value: integer);
begin
  vvttype1:=value;

end;

procedure TForm_lot.N1Click(Sender: TObject);
begin
  try
    Form_lotmb1:=tForm_lotmb1.Create(application);
    Form_lotmb1.ADOS_17.close;
    Form_lotmb1.ADOS_17.Parameters.ParamByName('@cut_no').Value:=ADO410_16cut_no.Value;
    Form_lotmb1.ADOS_17.Parameters.ParamByName('@vdept_ptr').Value:=ADO410_16dept_ptr.Value;
    Form_lotmb1.ADOS_17.Prepared;
    Form_lotmb1.ADOS_17.Open;

    Form_lotmb1.ShowModal;
  finally
    Form_lotmb1.ADOS_17.Close;
    Form_lotmb1.Free;
  end;
end;

procedure TForm_lot.N2Click(Sender: TObject);
begin
  try
    Form_lotmb2:=tForm_lotmb2.Create(application);
    Form_lotmb2.Caption :='材料成本计算明细:'+ADO410_16ABBR_NAME.Value;

    Form_lotmb2.ADOS_19.close;
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@vtype').Value:=vvttype1;
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@vdept_ptr').Value:=ADO410_16dept_ptr.Value;
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@d451').Value:=ADO410_16rkey.Value;
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@OVHD_MTAL_1').Value:='';
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@yield_sqft').Value:='';
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@STD_MTAL_1').Value:='';
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@STD_MTAL_2').Value:='';
    Form_lotmb2.ADOS_19.Parameters.ParamByName('@warehouse_ptr').Value:=ADO410_16warehouse_ptr.Value;
    Form_lotmb2.ADOS_19.Prepared;
    Form_lotmb2.ADOS_19.Open;

    Form_lotmb2.Edit1.Text:=Form_lotmb2.ADOS_19.Parameters.ParamByName('@OVHD_MTAL_1').Value;
    Form_lotmb2.Edit2.Text:=Form_lotmb2.ADOS_19.Parameters.ParamByName('@yield_sqft').Value;
    Form_lotmb2.Edit3.Text:=Form_lotmb2.ADOS_19.Parameters.ParamByName('@STD_MTAL_1').Value;
    Form_lotmb2.Edit4.Text:=Form_lotmb2.ADOS_19.Parameters.ParamByName('@STD_MTAL_2').Value;


    Form_lotmb2.ADOS_20.close;
    Form_lotmb2.ADOS_20.Parameters.ParamByName('@vtype').Value:=vvttype1;
    Form_lotmb2.ADOS_20.Parameters.ParamByName('@vdept_ptr').Value:=ADO410_16dept_ptr.Value;
    Form_lotmb2.ADOS_20.Parameters.ParamByName('@d451').Value:=ADO410_16rkey.Value;
    Form_lotmb2.ADOS_20.Parameters.ParamByName('@warehouse_ptr').Value:=ADO410_16warehouse_ptr.Value;
    Form_lotmb2.ADOS_20.Prepared;
    Form_lotmb2.ADOS_20.Open;

    Form_lotmb2.Label4.Caption:='每平米材料成本='+ADO410_16std_sqrt_cost.AsString+'/'+
      '('+Form_lotmb2.Edit3.Text+'+'+Form_lotmb2.Edit4.Text+')'+'*'+Form_lotmb2.Edit1.Text;

    Form_lotmb2.Label5.Caption:=
    FloatToStr(
    (ADO410_16std_sqrt_cost.Value* StrToFloat(Form_lotmb2.Edit1.Text))/
    (StrToFloat(Form_lotmb2.Edit3.Text)+ StrToFloat(Form_lotmb2.Edit4.Text))
    );
        
    Form_lotmb2.ShowModal;
  finally
    Form_lotmb2.ADOS_19.close;
    Form_lotmb2.ADOS_20.close;
    Form_lotmb2.Free;
  end;

end;

procedure TForm_lot.N3Click(Sender: TObject);
begin
  try
    Form_lotmb3:=tForm_lotmb3.Create(application);
    Form_lotmb3.Caption :='制造费用计算明细:'+self.ADO410_16ABBR_NAME.Value;
    Form_lotmb3.Label2.Caption:=ADO410_16unit_sq.AsString;

    Form_lotmb3.ADOS_21.close;
    Form_lotmb3.ADOS_21.Parameters.ParamByName('@vtype').Value:=vvttype1;
    Form_lotmb3.ADOS_21.Parameters.ParamByName('@vd451ptr').Value:=ADO410_16.FieldByName('rkey').AsInteger;
    Form_lotmb3.ADOS_21.Parameters.ParamByName('@vdept_ptr').Value:=ADO410_16.FieldByName('dept_ptr').AsInteger;
    Form_lotmb3.ADOS_21.Parameters.ParamByName('@warehouse_ptr').Value:=ADO410_16warehouse_ptr.Value;
    Form_lotmb3.ADOS_21.Prepared;
    Form_lotmb3.ADOS_21.Open;

    Form_lotmb3.ADOS_22.close;

    if (Sender as TMenuItem).Tag=0 then
     Form_lotmb3.ADOS_22.CommandText:=Form_lotmb3.ADOS_22.CommandText+
     ' and (isnull(data0410.WTYPE,0)<>3)'
    else
     Form_lotmb3.ADOS_22.CommandText:=Form_lotmb3.ADOS_22.CommandText+
     ' and (isnull(data0410.WTYPE,0)=3)';
         
    Form_lotmb3.ADOS_22.Parameters.ParamByName('vdept_ptr').Value:=ADO410_16.FieldByName('dept_ptr').AsInteger;
    Form_lotmb3.ADOS_22.Parameters.ParamByName('d451').Value:=ADO410_16.FieldByName('rkey').AsInteger;
    Form_lotmb3.ADOS_22.Parameters.ParamByName('warehouse_ptr').Value:=ADO410_16warehouse_ptr.Value;
    Form_lotmb3.ADOS_22.Prepared;
    Form_lotmb3.ADOS_22.Open;

    Form_lotmb3.ShowModal;
  finally
    Form_lotmb3.ADOS_21.close;
    Form_lotmb3.ADOS_22.close;
    Form_lotmb3.Free;
  end;

end;

procedure TForm_lot.N4Click(Sender: TObject);
begin
  try
    Form_lining:=TForm_lining.Create(application);

    Form_lining.AD489.Close;
    Form_lining.AD489.Parameters.ParamValues['key06']:=ADO410_16.FieldByName('reky06').AsInteger;
    Form_lining.AD489.Parameters.ParamValues['step']:= ADO410_16step.Value;
    Form_lining.AD489.Open;

    Form_lining.ShowModal;
  finally
   Form_lining.AD489.close;

    Form_lining.Free;
  end;

end;

procedure TForm_lot.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(ADO410_16.CommandText);
end;

procedure TForm_lot.BitBtn2Click(Sender: TObject);
begin
common.Export_dbGridEH_to_Excel(DBGridEh1,'作业单成本明细');
end;

procedure TForm_lot.PopupMenu1Popup(Sender: TObject);
begin
N7.Enabled:=ADO410_16sc_type.Value='外发';
end;

end.
