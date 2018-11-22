unit inv_search;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls;

type
  Tform_inv = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    RadioGroup1: TRadioGroup;
    ADOQuery1: TADOQuery;
    ADOQuery1rkey: TIntegerField;
    ADOQuery1manu_part_number: TStringField;
    ADOQuery1manu_part_desc: TStringField;
    ADOQuery1customer_ptr: TIntegerField;
    ADOQuery1analysis_code_2: TStringField;
    ADOQuery1bath_former: TStringField;
    ADOQuery1out_in: TStringField;
    ADOQuery1LAYERS: TWordField;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
   procedure init(iWHOUSE_PTR,iDept_ptr:integer);
    { Public declarations }
  end;

var
  form_inv: Tform_inv;

implementation
uses DM_u;
{$R *.dfm}

procedure Tform_inv.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;


procedure Tform_inv.Edit1Change(Sender: TObject);
begin
if trim(Edit1.text)<>'' then
 if radiogroup1.ItemIndex=0 then
  Adoquery1.Filter :='manu_PART_NUMBER like '''+Trim(Edit1.Text)+'%'''
 else
  Adoquery1.Filter :='manu_PART_DESC like ''%'+Trim(Edit1.Text)+'%'''
else
 Adoquery1.filter:='';
end;

procedure Tform_inv.BitBtn1Click(Sender: TObject);
begin
 edit1.Text :='';
 edit1.SetFocus;
end;

procedure Tform_inv.DBGrid1DblClick(Sender: TObject);
begin
  if not adoquery1.IsEmpty then ModalResult:=mrok;
end;

procedure Tform_inv.DBGrid1KeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
 if (key=13) and (not adoquery1.IsEmpty) then ModalResult:=mrok;
end;

procedure Tform_inv.RadioGroup1Click(Sender: TObject);
begin
 label1.Caption := radiogroup1.Items.Strings[radiogroup1.itemindex];
 edit1.SetFocus;
end;

procedure Tform_inv.DataSource1DataChange(Sender: TObject; Field: TField);
begin
  button1.Enabled:=not adoquery1.IsEmpty ;
end;

procedure Tform_inv.init(iWHOUSE_PTR,iDept_ptr:integer);
begin
  if iFlag=0 then
    ADOQuery1.SQL.Text:='select rkey,manu_part_number,manu_part_desc,customer_ptr,analysis_code_2,'+
                        'case data0025.ttype when 0 then ''批量'' when 1 then ''样板'' end as bath_former,'+
                        'case when parent_ptr is null then ''外层'' else ''内层'' end as out_in,'+
                        'LAYERS from data0025 order by manu_part_number desc'
  else begin
    ADOQuery1.Parameters[0].Value:=iWHOUSE_PTR;
    ADOQuery1.Parameters[1].Value:=iDept_ptr;
  end;
  adoquery1.Open;
end;

end.
