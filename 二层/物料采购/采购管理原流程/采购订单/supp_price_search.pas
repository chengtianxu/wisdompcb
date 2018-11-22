unit supp_price_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, ComCtrls, StdCtrls, Mask, DBCtrls, DB, ADODB;

type
  TForm3 = class(TForm)
    Bar1: TStatusBar;
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label11: TLabel;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    DBText1: TDBText;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    DBText2: TDBText;
    Label4: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label19: TLabel;
    DBEdit7: TDBEdit;
    ADOQuery1code: TStringField;
    ADOQuery1supplier_name: TStringField;
    ADOQuery1phone: TStringField;
    ADOQuery1supplier_part_no: TStringField;
    ADOQuery1sugg_reorder_qty: TFloatField;
    ADOQuery1lead_time: TSmallintField;
    ADOQuery1CONVERSION_FACTOR: TFloatField;
    ADOQuery1avl_flag: TStringField;
    ADOQuery1curr_name: TStringField;
    ADOQuery1curr_code: TStringField;
    ADOQuery1unit_code: TStringField;
    ADOQuery1unit_name: TStringField;
    ADOQuery1v_flag: TStringField;
    DBEdit8: TDBEdit;
    Label17: TLabel;
    ADOQuery1AMT_QUAN_FLAG: TWordField;
    ADOQuery1v_meoth: TStringField;
    DBEdit9: TDBEdit;
    Label18: TLabel;
    ADOQuery1v_min_order: TFloatField;
    ADOQuery1MIN_ORDER_QTY: TFloatField;
    ADOQuery1MIN_ORDER_AMT: TFloatField;
    DBEdit10: TDBEdit;
    StringGrid1: TStringGrid;
    Button1: TButton;
    Button2: TButton;
    ADOQuery1tax_2: TFloatField;
    Label6: TLabel;
    DBEdit11: TDBEdit;
    ADOQuery1PRICE_1: TFloatField;
    ADOQuery1PRICE_2: TFloatField;
    ADOQuery1PRICE_3: TFloatField;
    ADOQuery1PRICE_4: TFloatField;
    ADOQuery1PRICE_5: TFloatField;
    ADOQuery1PRICE_6: TFloatField;
    ADOQuery1QUAN_VOL_1: TFloatField;
    ADOQuery1QUAN_VOL_2: TFloatField;
    ADOQuery1QUAN_VOL_3: TFloatField;
    ADOQuery1QUAN_VOL_4: TFloatField;
    ADOQuery1QUAN_VOL_5: TFloatField;
    ADOQuery1DISC_1: TFloatField;
    ADOQuery1DISC_2: TFloatField;
    ADOQuery1DISC_3: TFloatField;
    ADOQuery1DISC_4: TFloatField;
    ADOQuery1DISC_5: TFloatField;
    ADOQuery1DISC_6: TFloatField;
    ADOQuery1rkey28: TIntegerField;
    ADOQuery1rkey23: TIntegerField;
    ADOQuery1currency_ptr: TIntegerField;
    ADOQuery1purchase_unit_ptr: TIntegerField;
    ADOQuery1tax_flag: TStringField;
    DBCheckBox1: TDBCheckBox;
    Label9: TLabel;
    DBEdit12: TDBEdit;
    ADOQuery1rohs: TStringField;
    procedure ADOQuery1CalcFields(DataSet: TDataSet);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure change_rno();
    procedure Button1Click(Sender: TObject);
    procedure ADOQuery1AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation
uses damo, add_po;
{$R *.dfm}

procedure TForm3.ADOQuery1CalcFields(DataSet: TDataSet);
begin
 if adoquery1avl_flag.Value='Y' then
  adoquery1v_flag.Value := '已认可'
 else
  if adoquery1avl_flag.Value='N' then
   adoquery1v_flag.Value := '未认可'
  else
   adoquery1v_flag.Value := '暂时认可';

 if ADOQuery1AMT_QUAN_FLAG.Value=1 then
  begin
   ADOQuery1v_meoth.Value := '按数量';
   form3.ADOQuery1v_min_order.Value := form3.ADOQuery1MIN_ORDER_QTY.Value;
  end
 else
  begin
   ADOQuery1v_meoth.Value := '按金额';
   form3.ADOQuery1v_min_order.Value := form3.ADOQuery1MIN_ORDER_AMT.Value;
  end;
end;

procedure TForm3.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=13 then button1click(sender);
end;

procedure TForm3.FormActivate(Sender: TObject);
begin
 stringgrid1.Cells[0,0] := '从';
 stringgrid1.Cells[1,0] := '至';
 stringgrid1.Cells[2,0] := '供应商价格';
 stringgrid1.Cells[3,0] := '折扣%';
 stringgrid1.Cells[0,1] := '0';
 change_rno();
 with dm.adoquery1 do
  begin                //查找首选供应商
   if active=true then active:=false;
   sql.Clear;
   SQL.Add('SELECT data0023.code from data0017,data0023');
   sql.Add('where data0017.pref_supplier_ptr= data0023.rkey');
   sql.Add('and data0017.rkey='+form2.rkey17.Caption);
   active:=true;
   if not isempty then
    bar1.SimpleText := '首选供应商: '+fieldvalues['code']
   else
    bar1.SimpleText := '首选供应商: '+'未定义';
  end;
end;

procedure TForm3.change_rno();
var
 i:byte;
begin
 for i:=1 to 6 do
 stringgrid1.Rows[i].Clear;
 stringgrid1.Cells[0,1] := '0';

stringgrid1.Cells[2,1] := '0.000';
stringgrid1.Cells[3,1] := '0.000';
 for i:=1 to 5 do
  if adoquery1.FieldValues['quan_vol_'+inttostr(i)]>0 then
   begin
    stringgrid1.Cells[1,i]:=formatfloat('0',adoquery1.FieldValues['quan_vol_'+inttostr(i)]);
    stringgrid1.Cells[2,i+1]:='0.000';
    stringgrid1.Cells[3,i+1]:='0.000';
    stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
    if i=5 then                     //处理价格折扣
     stringgrid1.Cells[1,6]:='无限制';
   end
  else
   begin
    stringgrid1.Cells[1,i] := '无限制';
    stringgrid1.Cells[2,i] := '0.000';
    stringgrid1.Cells[3,i] := '0.000';
    break;
   end;
  for i:=1 to 6 do
   begin
  if adoquery1.FieldValues['price_'+inttostr(i)]>0 then
   stringgrid1.Cells[2,i]:=formatfloat('0.000',adoquery1.FieldValues['price_'+inttostr(i)]);

  if adoquery1.FieldValues['disc_'+inttostr(i)]>0 then
   stringgrid1.Cells[3,i]:=formatfloat('0.000',adoquery1.FieldValues['disc_'+inttostr(i)]);
  end;
end;

procedure TForm3.Button1Click(Sender: TObject);
begin
 if (ADOQuery1avl_flag.Value = 'N') then     //材料是否需要认可供应商
  begin
   showmessage('供应商价格没有认可无法采购!')    
  end
 else
  begin
   ModalResult:=mrok;
  end;
end;

procedure TForm3.ADOQuery1AfterScroll(DataSet: TDataSet);
begin
 form3.change_rno();
end;

end.
