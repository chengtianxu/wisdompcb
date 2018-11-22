unit PickBOMPart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, DB, ADODB;

type
  TfrmPickBOMPart = class(TForm)
    labelroute: TLabel;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CheckBox1: TCheckBox;
    edtPartNo: TEdit;
    labelUnit: TLabel;
    SpeedButton1: TSpeedButton;
    edtQty: TEdit;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    labelPartName: TLabel;
    adsPart: TADODataSet;
    adsRoute: TADODataSet;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtQtyKeyPress(Sender: TObject; var Key: Char);
    procedure Button1Click(Sender: TObject);
    procedure edtPartNoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Enter(PartNo:string;vRkey:integer);
  end;

var
  frmPickBOMPart: TfrmPickBOMPart;

implementation
uses dm,common,Pick_Item_Single,ConstVar, Pick_BOM_Item;
{$R *.dfm}

procedure TfrmPickBOMPart.SpeedButton1Click(Sender: TObject);
var
 // tmpstr:string;
  InputVar: PDlgInput ;
  inv_part_number, Unit_Code, Inv_Part_Description: string;
  rkey: Integer;
begin
  {
 frmPick_Item_Single:=TfrmPick_Item_Single.Create(nil);
 try
    InputVar.Fields := 'inv_part_number/材料代号/150,inv_part_description/材料描述/120,unit_code/单位/50,quan_on_hand/库存/50';
    InputVar.Sqlstr :=' select data0496.group_name,data0017.rkey,data0017.inv_part_number,data0017.inv_part_description, ' +
                      ' data0002.unit_code,data0017.quan_on_hand from data0017,data0496,data0002 where data0017.stock_unit_ptr=data0002.rkey ' +
                      ' and data0017.group_ptr=data0496.rkey order by data0017.inv_part_number';
    inputvar.KeyField:='inv_part_number';
    inputvar.InPut_value:=edtPartNo.Text;
    InputVar.AdoConn := dmcon.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar);
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edtPartNo.Text := frmPick_Item_Single.adsPick.Fieldbyname('inv_part_number').AsString;
      edtPartNo.Tag:=frmPick_Item_Single.adsPick.Fieldbyname('rkey').AsInteger;
      labelUnit.Caption := frmPick_Item_Single.adsPick.Fieldbyname('Unit_Code').AsString;
      labelPartName.Caption := frmPick_Item_Single.adsPick.Fieldbyname('Inv_Part_Description').AsString;
      edtQty.SetFocus;
    end
 finally
   frmPick_Item_Single.Free ;
 end;
     }


  if ShowPIckBomItem(Self,inv_part_number,rkey, Unit_Code, Inv_Part_Description) = mrOK then
  begin
      edtPartNo.Text := inv_part_number;
      edtPartNo.Tag:=rkey;
      labelUnit.Caption := Unit_Code;
      labelPartName.Caption := Inv_Part_Description;
      edtQty.SetFocus;
  end;

end;

procedure TfrmPickBOMPart.edtQtyKeyPress(Sender: TObject; var Key: Char);
begin
  if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
  if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
  if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
    Abort;
  if (key='-') then abort;
//  if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
  if Length((Sender as TEdit).text)>0 then
    if (key='-') then abort;
end;

procedure TfrmPickBOMPart.Enter(PartNo: string;vRkey:integer);
begin
  edtPartNo.Text :=PartNo;
  adsPart.Close;
  adsPart.Parameters[0].Value := PartNo;
  adsPart.Open;
  if not adsPart.IsEmpty then
  begin
    edtPartNo.Text := PartNo;
    edtPartNo.Tag:=adsPart.FieldByName('rkey').AsInteger;
    labelUnit.Caption := adsPart.FieldByName('Unit_Code').AsString;
    labelPartName.Caption := adsPart.FieldByName('Inv_Part_Description').AsString;
  end;
  adsRoute.close;
  adsRoute.Parameters[0].Value := vRkey;
  adsRoute.open;
  if vRkey<>-1 then //新增 
    Add_ComBox_List(adsRoute,'DEPT_CODE',ComboBox1)
  else
  begin
    ComboBox1.Visible:=false;
  end;
end;

procedure TfrmPickBOMPart.Button1Click(Sender: TObject);
begin
  if trim(edtPartNo.Text)='' then
  begin
    ShowMsg('材料不能为空',1);
    abort;
  end
  else if trim(edtQty.Text)='' then
  begin
    ShowMsg('材料用量不能为空',1);
    abort;
  end
  else if (trim(ComboBox1.Text)='') and (ComboBox1.Visible) then
  begin
    ShowMsg('工序不能为空',1);
    abort;
  end;
  ModalResult := mrok;
end;

procedure TfrmPickBOMPart.edtPartNoExit(Sender: TObject);
begin
  if self.ActiveControl=Button2 then exit;
  dmcon.tmp1.Close;
  dmcon.tmp1.SQL.Text:=' select data0496.group_name,data0017.rkey,data0017.inv_part_number,data0017.inv_part_description, ' +
                      ' data0002.unit_code,data0017.quan_on_hand from data0017,data0496,data0002 where data0017.stock_unit_ptr=data0002.rkey ' +
                      ' and data0017.group_ptr=data0496.rkey and inv_part_number='''+edtPartNo.Text+'''';
  dmcon.tmp1.Open;
  if not dmcon.tmp1.IsEmpty then
  begin
    edtPartNo.Text := dmcon.tmp1.Fieldbyname('inv_part_number').AsString;
    edtPartNo.Tag:=dmcon.tmp1.Fieldbyname('rkey').AsInteger;
    labelUnit.Caption := dmcon.tmp1.Fieldbyname('Unit_Code').AsString;
    labelPartName.Caption := dmcon.tmp1.Fieldbyname('Inv_Part_Description').AsString;
    edtQty.SetFocus;
  end else begin
    showmessage('材料编码错误...');
    edtPartNo.SetFocus;
    abort;
  end;
end;

procedure TfrmPickBOMPart.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_return then self.SelectNext(self.ActiveControl,true,true);
end;

end.
