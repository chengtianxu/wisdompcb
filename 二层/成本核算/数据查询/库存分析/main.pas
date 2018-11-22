unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, Buttons, Grids, ExtCtrls, Spin,dateutils;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    vprev: TLabel;
    PopupMenu1: TPopupMenu;
    WIP: TMenuItem;
    FG: TMenuItem;
    STOCK: TMenuItem;
    ONLINE: TMenuItem;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SGrid1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure WIPClick(Sender: TObject);
    procedure FGClick(Sender: TObject);
    procedure STOCKClick(Sender: TObject);
    procedure ONLINEClick(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    procedure update_grid(const v_year :integer);
  public
    { Public declarations }
    flag : integer;//用来标识主表data0444的rkey指针
  end;

var
  Form1: TForm1;

implementation
uses damo,unit_wip,unit_fg,unit_mat,unit_online,common,Frm_InOut_u;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dm.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

// dm.ADOConnection1.Open;
end;

procedure tform1.update_grid(const v_year :integer);
var i:integer;
begin
 if not dm.ADOConnection1.Connected then exit;
 dm.ADOQ444.Close;
 dm.ADOQ444.Parameters[0].Value:=v_year;
 dm.ADOQ444.Open;
 if dm.ADOQ444.RecordCount>0 then
 begin
  dm.ADOQ444.First;
  sgrid1.RowCount:=dm.ADOQ444.RecordCount+1;
  while  not dm.ADOQ444.Eof do
   for i:=1 to dm.ADOQ444.RecordCount do
   begin
     sgrid1.Cells[0,i]:=inttostr(i);
     sgrid1.Cells[1,i]:=dm.ADOQ444cut_date.AsString; //'截数日期';
     sgrid1.Cells[2,i]:=dm.ADOQ444tdate.AsString; //'截数时间';
     sgrid1.Cells[3,i]:=dm.ADOQ444employee_name.Value; //'截数人';
     sgrid1.Cells[4,i]:=dm.ADOQ444rkey.AsString;
     dm.ADOQ444.Next;
   end;
 end
 else begin
  sgrid1.RowCount:=2;
  sgrid1.rows[1].Text:='';
 end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
 if  (dm.ADOConnection1.Connected) then
 begin
   try
     sgrid1.Cells[0,0]:='序号';
     sgrid1.Cells[1,0]:='截数日期';
     sgrid1.Cells[2,0]:='截数时间';
     sgrid1.Cells[3,0]:='截数人';
     sgrid1.ColWidths[4]:=0;  //第4列不显示

     self.SpinEdit1.MaxValue:=yearof(now);
     self.SpinEdit1.Value:=SpinEdit1.MaxValue;
     self.update_grid(spinedit1.Value);
   except
     showmessage('请与管理员联系！');
     application.Terminate;
   end;
 end;
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  application.Terminate;
end;

procedure TForm1.SGrid1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var column,row:longint;
begin
 if button=mbright then
 begin
  SGrid1.MouseToCell(x,y,column,row);
  if (row>0)and (trim(sgrid1.Cells[0,1])<>'') then SGrid1.Row:=row;
 end;
end;

procedure TForm1.WIPClick(Sender: TObject);
begin
  flag:=strtoint(sgrid1.Cells[4,sgrid1.row]);
  with dm.ADOD448 do
  begin
    close;
    parameters[1].Value:=flag;
    open;
    filter:='';
  end;

  with dm.ADOD448a do
  begin
    close;
    parameters[0].Value:=flag;
    open;
    filter:='';
  end;

  with dm.ADOD448b do
  begin
    close;
    parameters[0].Value:=flag;
    open;
    filter:='';
  end;

  try
    form_wip:=tform_wip.Create(application);
    with dm.tmp do
    begin
     close;
     sql.Text:='select MATL_CST_IN_WIP_CLOSED,OVHD_CST_IN_WIP_CLOSED,'+
     'OVHD_CST_IN_SFG_CLOSED,MATL_CST_IN_SFG_CLOSED,TDATE'+
     ' from data0444 where rkey='+inttostr(flag);
     Open;
     form_wip.Edit2.Text:=Fields[0].AsString;
     form_wip.Edit3.Text:=Fields[1].AsString;
     form_wip.Edit4.Text:=Fields[2].AsString;
     form_wip.Edit5.Text:=Fields[3].AsString;
     form_wip.v_tdate:=fieldbyname('TDATE').AsDateTime;
    end;
    Form_wip.FD444rkey := IntToStr(flag);
    form_wip.ShowModal;
  finally
    dm.ADOD448a.Filter:='';
    dm.ADOD448b.Filter:='';
    dm.ADOD448.Filter:='';
    dm.ADOD448a.Close;
    dm.ADOD448b.Close;
    dm.ADOD448.Close;
    form_wip.Free;
  end;
end;

procedure TForm1.FGClick(Sender: TObject);
begin
 try
  form_fg:=tform_fg.Create(application);
  flag:=strtoint(sgrid1.Cells[4,sgrid1.row]);

  with dm.ADO449 do
   begin
   close;
   parameters[0].Value:=flag;
   open;
   end;

   with dm.ADOd449 do
   begin
    close;
    parameters[1].Value:=flag;
    open;
   end;
    with dm.tmp do
    begin
     close;
     sql.Text:='select matl_cst_in_fg_closed,ovhd_cst_in_fg_closed,'+
     'OVHD1_CST_IN_FG_CLOSED,outsource_CST_IN_FG_CLOSED,TDATE'+
     ' from data0444 where rkey='+inttostr(flag);
     Open;
     Form_fg.Edit2.Text:=Fields[0].AsString;
     Form_fg.Edit3.Text:=Fields[1].AsString;
     Form_fg.Edit4.Text:=Fields[2].AsString;
     Form_fg.Edit5.Text:=Fields[3].AsString;
     Form_fg.v_tdate:=fieldbyname('TDATE').AsDateTime;
    end;
    Form_fg.FD444rkey := IntToStr(flag);
   form_fg.ShowModal;
 finally
  dm.ADO449.Filter:='';
  dm.ADOd449.Filter:='';
  dm.ADO449.Close;
  dm.ADOD449.Close;
  form_fg.Free;
 end;
end;

procedure TForm1.STOCKClick(Sender: TObject);
begin
  try
  form_mat:=tform_mat.Create(application);
  flag:=strtoint(sgrid1.Cells[4,sgrid1.row]);
  with dm.ADOQ445 do
  begin
   close;
   parameters[0].Value:=flag;
   open;
  end;

  with dm.ADOS445 do
  begin
   close;
   parameters[1].Value:=flag;
   open;
  end;

  with dm.ADOD445 do
  begin
   close;
   parameters[1].Value:=flag;
   open;
  end;
  form_MAT.ShowModal;
 finally
  dm.ADOQ445.Filter:='';
  dm.ADOS445.Filter:='';
  dm.ADOD445.Filter:='';

  dm.ADOQ445.Close;
  dm.ADOS445.Close;
  dm.ADOD445.Close;
  form_MAT.Free;
 end;
end;

procedure TForm1.ONLINEClick(Sender: TObject);
begin
 try
  form_online:=tform_online.Create(application);
  flag:=strtoint(sgrid1.Cells[4,sgrid1.row]);
  with dm.ADOS462 do
   begin
   close;
   parameters[1].Value:=flag;
   open;
   end;

   with dm.ADOD462a do
   begin
    close;
    parameters[1].Value:=flag;
    open;
   end;

   with dm.ADOD462b do
   begin
    close;
    parameters[1].Value:=flag;
    open;
   end;
    with dm.tmp do
    begin
     close;
     sql.Text:='select MATL_CST_IN_DEPT_CLOSED'+
     ' from data0444 where rkey='+inttostr(flag);
     Open;
     form_online.Edit2.Text:=Fields[0].AsString;
    end;
   form_online.ShowModal;
 finally
   dm.ADOS462.Filter:='';
  dm.ADOD462a.Filter:='';
  dm.ADOD462b.Filter:='';

  dm.ADOS462.Close;
  dm.ADOD462a.Close;
  dm.ADOD462b.Close;
  Form_online.Free;
 end;
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  self.update_grid(spinedit1.Value);
end;


procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  if sgrid1.Cells[1,sgrid1.row]='' then exit;
  with TFrm_InOut.Create(nil) do
  try
    init(sgrid1.Cells[1,sgrid1.row],sgrid1.Cells[2,sgrid1.row],sgrid1.Cells[4,sgrid1.row]);
    showmodal;
  finally
    free;
  end;
end;

end.
