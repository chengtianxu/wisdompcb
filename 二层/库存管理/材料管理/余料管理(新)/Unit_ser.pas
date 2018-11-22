unit Unit_ser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, ADODB, Menus, Buttons, Grids;

type
  TForm_ser = class(TForm)
    StaticText2: TStaticText;
    sgrid1: TStringGrid;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    StaticText4: TStaticText;
    ListBox2: TListBox;
    Edit2: TEdit;
    BitBtn10: TBitBtn;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ComboBox1: TComboBox;
    dtpk1: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    dtpk2: TDateTimePicker;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1Change(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Edit2Change(Sender: TObject);
  private
    { Private declarations }
   procedure update_sgrid(sgrid_row:byte);
  public
    { Public declarations }
  end;

var
  Form_ser: TForm_ser;

implementation
uses damo, selnow_form,main,common;

{$R *.dfm}

procedure tform_ser.update_sgrid(sgrid_row :byte);
var flag: byte;
begin
 flag:=10;//给flag赋初值
 case listbox2.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid_row]:='and data0556.mat_code LIKE ''%'+trim(edit2.Text)+'%''';
 1:
  sgrid1.Cells[2,sgrid_row]:='and data0556.mat_desc LIKE ''%'+trim(edit2.Text)+'%''';
 2:
  begin
   if trim(combobox1.Text)='出仓' then flag:=2
   else
    if trim(combobox1.Text)='入仓' then flag:=0;
   sgrid1.Cells[2,sgrid_row]:='and data0558.ttype='+inttostr(flag);
  end;
 3:
  sgrid1.Cells[2,sgrid_row]:='and data0558.rema_number LIKE ''%'+trim(edit2.Text)+'%''';

 4:
  sgrid1.Cells[2,sgrid_row]:='and Data0558.tdate >='''+datetostr(dtpk1.date)+
                            ''' and Data0558.tdate<='''+datetostr(dtpk2.date+1)+'''';
 end;
end;
procedure TForm_ser.BitBtn4Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
  sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_ser.BitBtn5Click(Sender: TObject);
 var
 i:byte;
begin
 for i:=1 to sgrid1.RowCount-1 do
  sgrid1.Rows[i].Clear;
  sgrid1.RowCount:=2;
end;

procedure TForm_ser.BitBtn6Click(Sender: TObject);
begin
self.Close;
end;

procedure TForm_ser.BitBtn10Click(Sender: TObject);
var
 i:byte;
 flag:integer;
begin
 flag:=10;//给flag赋初值


 for i:=1 to sgrid1.RowCount-2 do
  if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
     (sgrid1.Cells[1,i]<>listbox2.Items[listbox2.ItemIndex]) then
  begin
   if listbox2.ItemIndex=4 then
      sgrid1.Cells[1,i]:='从'+datetostr(dtpk1.Date)+'到'+datetostr(dtpk2.Date)
   else
    if listbox2.ItemIndex=2 then
      sgrid1.Cells[1,i]:=combobox1.Text
   else
      sgrid1.Cells[1,i]:=edit2.Text;
   update_sgrid(i);
   exit;
  end
 else
    if (sgrid1.Cells[0,i]=listbox2.Items[listbox2.ItemIndex]) and
       (sgrid1.Cells[1,i]=listbox2.Items[listbox2.ItemIndex]) then  exit;

  sgrid1.Cells[0,sgrid1.RowCount-1]:=listbox2.Items[listbox2.itemindex];
  if listbox2.ItemIndex=4 then
     sgrid1.Cells[1,sgrid1.RowCount-1]:='从'+datetostr(dtpk1.Date)+'到'+datetostr(dtpk2.Date)
 else
    if listbox2.ItemIndex=2 then  sgrid1.Cells[1,sgrid1.RowCount-1]:=combobox1.Text
 else
    sgrid1.Cells[1,sgrid1.RowCount-1]:=edit2.Text;

 case listbox2.ItemIndex of
 0:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0556.mat_code LIKE ''%'+trim(edit2.Text)+'%''';
 1:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0556.mat_desc LIKE ''%'+trim(edit2.Text)+'%''';
 2:
  begin
   if trim(combobox1.Text)='出仓' then flag:=2
   else if trim(combobox1.Text)='入仓' then flag:=0;
   sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0558.ttype='+inttostr(flag);
  end;
 3:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and data0558.rema_number LIKE ''%'+trim(edit2.Text)+'%''';

 4:
  sgrid1.Cells[2,sgrid1.RowCount-1]:='and Data0558.tdate >='''+datetostr(dtpk1.date)+
                            '''and Data0558.tdate <='''+datetostr(dtpk2.date+1)+'''';
 end;

 sgrid1.RowCount:=sgrid1.RowCount+1;

end;

procedure TForm_ser.BitBtn3Click(Sender: TObject);
var
 i:byte;
begin
if sgrid1.RowCount=2 then
  begin
   messagedlg('请首先定义查询条件!',mtinformation,[mbok],0) ;
   listbox2.SetFocus;
  end
  else
  begin
  try
  form_selnow:=tform_selnow.Create(application);
  with dm.ADOD558 do
   begin
    close;
    dm.ADOD558.CommandText:=dm.sqlnow;
    for i:=1 to sgrid1.RowCount-2 do
    dm.ADOD558.CommandText:=dm.ADOD558.CommandText+#32+sgrid1.Cells[2,i];
    open;
   end;

   

  finally
     if (strtoint(vprev)<4)  then
     begin
     form_selnow.DBGrid1.Columns[9].Visible:=False;
     form_selnow.DBGrid1.Columns[10].Visible:=False;
     end;
   form_selnow.ShowModal;
   form_selnow.Free;

  end;
 end;
end;

procedure TForm_ser.N1Click(Sender: TObject);
var
 i:byte;
begin
 for i:=sgrid1.Row to sgrid1.RowCount-2 do
  sgrid1.Rows[i].Text:=sgrid1.Rows[i+1].Text;
 sgrid1.RowCount:=sgrid1.RowCount-1;
end;

procedure TForm_ser.FormCreate(Sender: TObject);
begin
dm.ADOD558.Open;
 //================对查询界面初始化============================
  listbox2.Selected[0]:=true;
  label1.Visible:=true;
  label2.Visible:=false;
  label3.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
  edit2.Text:='';
  edit2.Visible:=true;
  combobox1.Visible:=false;
  bitbtn4.Enabled:=false;
  bitbtn10.Enabled:=false ;
  sgrid1.Cells[0,0]:='条件名';
  sgrid1.Cells[1,0]:='条件值';

 // dtpk2.Date:=strtodatetime(form1.sys_time);
  dtpk2.Date:=Now;
  dtpk1.Date:=dtpk2.Date-5;

end;

procedure TForm_ser.ComboBox1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if trim(edit2.Text)<>'' then
 bitbtn10.Enabled:=true
else
 bitbtn10.Enabled:=false;
end;

procedure TForm_ser.ComboBox1Change(Sender: TObject);
begin
if combobox1.Text<>'' then bitbtn10.Enabled:=true
 else
  bitbtn10.Enabled:=false;
end;

procedure TForm_ser.ListBox2Click(Sender: TObject);
begin
 label1.Visible:=true;
 label1.Caption:=listbox2.Items[listbox2.itemindex];
  label2.Visible:=false;
  label3.Visible:=false;
  dtpk1.Visible:=false;
  dtpk2.Visible:=false;
  edit2.Text:='';
  edit2.Visible:=true;
  combobox1.Visible:=false ;
  bitbtn10.Enabled:=false;
case listbox2.ItemIndex of
 0,1,3:edit2.SetFocus;
 2:
  begin
   combobox1.Visible:=true;
   edit2.Visible:=false;
   combobox1.SetFocus;
  end;
 4:
  begin
  bitbtn10.Enabled:=true;
  label1.Visible:=false;
  label3.Visible:=true;
  label2.Visible:=true;
  dtpk1.Visible:=true;
  dtpk2.Visible:=true;
  edit2.Visible:=false;
  dtpk1.SetFocus;
  end;
 end;
end;

procedure TForm_ser.sgrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 bitbtn4.Enabled:=false
 else
  bitbtn4.Enabled:=true;
end;

procedure TForm_ser.PopupMenu1Popup(Sender: TObject);
begin
if sgrid1.Row=sgrid1.RowCount-1 then
 n1.Enabled:=false
else
  n1.Enabled:=true;
end;

procedure TForm_ser.sgrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
 column,row:longint;
begin
if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if (row>0)and (row<sgrid1.RowCount-1) then SGrid1.Row:=row;
 end;
end;

procedure TForm_ser.Edit2Change(Sender: TObject);
begin
  if trim(edit2.Text)<>'' then bitbtn10.Enabled:=true
  else bitbtn10.Enabled:=false;
end;

end.



