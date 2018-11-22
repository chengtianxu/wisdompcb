unit layer_list;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Mask, Buttons, ToolWin, ComCtrls, ExtCtrls,
  Menus, DB, ADODB;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    FontDialog1: TFontDialog;
    procedure BitBtn1Enter(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);

  private
    { Private declarations }
   function number_error(number: string): boolean;
   procedure Menuonclick(Sender: TObject);    
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses damo;

{$R *.dfm}

procedure TForm2.BitBtn1Enter(Sender: TObject);
begin
if trim(dbedit1.Text)='' then
 begin
  messagedlg('层压代码不能为空!',mtinformation,[mbcancel],0);
  dbedit1.SetFocus;
  exit;
 end;
if trim(dbedit2.Text)='' then
 begin
  messagedlg('层压名称不能为空!',mtinformation,[mbcancel],0);
  dbedit2.SetFocus;
  exit;
 end;
end;

function TForm2.number_error(number: string): boolean;
begin
result:=false;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Add('select RECORD_KEY from data0193');
  sql.Add('where CODE='''+number+'''');
  open;
  if not IsEmpty then  result:=true;
 end;
end;

procedure TForm2.BitBtn1Click(Sender: TObject);
begin

if (dm.ADS193.State=dsinsert) and (number_error(trim(dbedit1.Text))) then  //新增
 begin
  messagedlg('层压代码重复!请手工重新输入',mterror,[mbok],0);
  dbedit1.SetFocus;
  exit;
 end;

 dm.ADOConnection1.BeginTrans;
TRY
 dm.ADS193.Post;
 dm.ADOConnection1.CommitTrans;
 self.ModalResult:=mrok;
except
 on E: Exception do
  begin
   dm.ADOConnection1.RollbackTrans;
   messagedlg(E.Message,mterror,[mbcancel],0);
   dbedit1.SetFocus;
   dm.ADS193.Edit;
  end;
end;
end;

procedure TForm2.Menuonclick(Sender: TObject);
begin
 with dm.ADOQuery1 do
 begin
   Active:=false;
   sql.clear;
   sql.add('select layers_info from DATA0193 where RECORD_KEY='+inttostr((sender as tmenuitem).tag));
   Active:=true;  //查找标准压层信息
   if not isempty then
   dbmemo1.Lines.Insert(dbmemo1.CaretPos.Y,fieldbyname('layers_info').asstring);
 end;
end;

procedure TForm2.FormActivate(Sender: TObject);
var
  item:tMenuItem;
begin
 dm.adoquery1.close;
 dm.ADOQuery1.SQL.Text:=
 'select RECORD_KEY,DESCRIPTION from data0193 where spec_rkey=''Y'' ';
 dm.adoquery1.Open;
 with dm.adoquery1 do
 while not eof do
 begin
   item:=TmenuItem.Create(self);
   item.Caption:=trim(dm.adoquery1.fieldbyname('description').asstring);
   item.AutoHotKeys:=maManual;
   item.onclick:=Menuonclick;
   item.Tag:=dm.ADOQuery1.FieldValues['RECORD_KEY'];
   PopupMenu1.Items[0].Insert(PopupMenu1.Items[0].count,item);
   next;
 end;
end;

procedure TForm2.N2Click(Sender: TObject);
var
  sp1,sp2:string;
  i,j:integer;
  InputString: string;
begin
while true do
begin
 InputString:= InputBox('标注厚度', '叠片厚度mm:', '');
 if length(trim(InputString))=0 then exit;
 try
  if strtofloat(trim(InputString))>0 then;
  break;
 except
 end;
end;

sp1:=' ';
sp2:=' ';
i:=dbMemo1.SelStart ;
j:=dbMemo1.CaretPos.y;
if copy(dbMemo1.Text,i,1)=' ' then sp1:='';
if copy(dbMemo1.Text,i+1,1)=' ' then sp2:='';
dbMemo1.Lines[j]:=copy(dbMemo1.Lines[j],1,i)+sp1+
  '(厚度:'+trim(InputString)+' mm)'+sp2+
  copy(dbMemo1.Lines[j],i+1,length(dbMemo1.Lines[j])-i);
dbMemo1.SelStart:=i+length(sp1)+length(trim(InputString))+length(sp2);
dbMemo1.SetFocus ;
end;

procedure TForm2.N3Click(Sender: TObject);
begin
 dbMemo1.SelectAll;
end;

procedure TForm2.N4Click(Sender: TObject);
begin
  if FontDialog1.Execute then
    dbMemo1.Font.Assign(FontDialog1.Font);
end;

end.
