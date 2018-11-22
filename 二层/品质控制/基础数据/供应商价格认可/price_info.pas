unit price_info;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Grids, Buttons;

type
  TForm2 = class(TForm)
    DBEdit1: TDBEdit;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBText2: TDBText;
    DBEdit3: TDBEdit;
    DBText3: TDBText;
    Label3: TLabel;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBText4: TDBText;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses main, note;

{$R *.dfm}

procedure TForm2.FormActivate(Sender: TObject);
var
 i:byte;
begin
 if form1.ADOQuery1AVL_FLAG.Value='Y' then
  combobox1.ItemIndex:=0
 else
  if form1.ADOQuery1AVL_FLAG.Value='N' then
   combobox1.ItemIndex:=1
  else
   combobox1.ItemIndex:=2;
 combobox2.ItemIndex:=form1.ADOQuery1AMT_QUAN_FLAG.Value-1;

 if form1.ADOQuery1AMT_QUAN_FLAG.Value=1 then
  dbedit13.DataField:='MIN_ORDER_QTY'
 else
  dbedit13.DataField:='MIN_ORDER_amt';

 stringgrid1.Cells[0,0] := '从';
 stringgrid1.Cells[1,0] := '至';
 stringgrid1.Cells[2,0] := '供应商价格';
 stringgrid1.Cells[3,0] := '折扣%';
 stringgrid1.Cells[0,1] := '0';
 stringgrid1.Cells[2,1] := '0.000';
 stringgrid1.Cells[3,1] := '0.000';

  for i:=1 to 5 do
   if form1.ADOQuery1.FieldValues['quan_vol_'+inttostr(i)]>0 then
    begin
     stringgrid1.Cells[1,i]:=formatfloat('0',form1.ADOQuery1.FieldValues['quan_vol_'+inttostr(i)]);
     stringgrid1.Cells[2,i+1]:='0.000';
     stringgrid1.Cells[3,i+1]:='0.000';
     stringgrid1.Cells[0,i+1]:='>'+stringgrid1.Cells[1,i];
     if i=5 then          //处理价格范围
      stringgrid1.Cells[1,6]:='无限制';
    end
   else
    begin
     stringgrid1.Cells[1,i] := '无限制';
     stringgrid1.Cells[2,i] := '0.000';
     stringgrid1.Cells[3,i] := '0.000';
     break;
    end;

  for i:=1 to 6 do                  //处理价格
  if form1.ADOQuery1.FieldValues['price_'+inttostr(i)]>0 then
   stringgrid1.Cells[2,i]:=formatfloat('0.000',form1.ADOQuery1.FieldValues['price_'+inttostr(i)])
  else
   break;

  for i:=1 to 6 do                   //处理折扣
  if form1.ADOQuery1.FieldValues['disc_'+inttostr(i)]>0 then
   stringgrid1.Cells[3,i]:=formatfloat('0.000',form1.ADOQuery1.FieldValues['disc_'+inttostr(i)])
  else
   break;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
 case combobox1.ItemIndex of
  0: form1.ADOQuery1AVL_FLAG.Value :='Y';
  1: form1.ADOQuery1AVL_FLAG.Value :='N';
  2: form1.ADOQuery1AVL_FLAG.Value :='T';
 end;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
var
 i:byte;
begin
 try
  edit_note:=tedit_note.Create(application);
 with form1.ADO2811 do
  begin           //查找记事本
   if active=true then active:=false;
   Parameters[2].Value:=form1.ADOQuery1RKEY.Value;
   active:=true;
   if not isempty then
   for i:=1 to 4 do
    edit_note.Memo1.Lines.Add(Fieldbyname('NOTE_PAD_LINE_'+inttostr(i)).AsString);
  end;

  edit_note.ShowModal;
 finally
  edit_note.free;
 end;


  
end;

end.
