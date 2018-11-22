unit Usbpr468;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, ComCtrls, StdCtrls, Buttons, ExtCtrls, Menus;

type
  TMain_Form = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    Edit1: TEdit;
    GroupBox2: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    DTPK1: TDateTimePicker;
    DTPk2: TDateTimePicker;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    Splitter1: TSplitter;
    PopupMenu1: TPopupMenu;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    PopupMenu2: TPopupMenu;
    N7: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    BitBtn5: TBitBtn;
    PopupMenu3: TPopupMenu;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPK1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DTPK1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGridEh2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure DBGridEh2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
 private
    { Private declarations }
    sys_longdate:string;
    fieldname:string;
    OldGridWnd : TWndMethod;
    PreColumn: TColumnEh;
    procedure NewGridWnd (var Message : TMessage);
    procedure item_click(sender:TObject);
  public
    { Public declarations }
  end;

var
  Main_Form: TMain_Form;

implementation

uses DMsbpr468,common,DateUtils;


{$R *.dfm}

procedure TMain_Form.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGridEh1.DataSource.DataSet.MoveBy(1)
   else
     DBGridEh1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TMain_Form.BitBtn1Click(Sender: TObject);
begin

    application.Terminate;

end;

procedure TMain_Form.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
    rkey:=dm.ADS492rkey.Value;
    dm.ADS492.Close;
    dm.ADS492.Open;
    dm.ADS492.Locate('rkey',rkey,[]);
end;

procedure TMain_Form.FormCreate(Sender: TObject);
begin
 if not app_init_2(dm.ADOConnection1) then
  begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
  end;

//  user_ptr:='2998';

  self.caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd'; 

  OldGridWnd := DBGridEh1.WindowProc;
  DBGridEh1.WindowProc := NewGridWnd;
end;

procedure TMain_Form.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS492.CommandText);
end;

procedure TMain_Form.DTPK1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DM.ADS492.Close;
  DM.ADS492.Parameters.ParamValues['dtpk1']:=dtpk1.Date;
  DM.ADS492.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
  DM.ADS492.Open;
end;
procedure TMain_Form.DTPK1Click(Sender: TObject);
begin
  dm.ADS492.Close;
  dm.ADS492.Parameters.ParamValues['dtpk1']:= dtpk1.Date;
  dm.ADS492.Parameters.ParamValues['dtpk2']:=dtpk2.Date+1;
  dm.ADS492.Open;
end;

procedure TMain_Form.Edit1Change(Sender: TObject);
begin
if trim(edit1.Text)<>'' then
  dm.ADS492.Filter:=fieldname+' like ''%'+trim(edit1.Text)+'%'''
else
  dm.ADS492.Filter:='';
end;

procedure TMain_Form.DBGridEh1TitleClick(Column: TColumnEh);
begin

if column.Title.SortMarker =smDownEh then
begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS492.IndexFieldNames:=Column.FieldName;
end
else
begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS492.IndexFieldNames:=Column.FieldName+' DESC';
end;

if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
 begin
    label1.Caption:=column.Title.Caption;
    self.fieldname:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else
      edit1.SetFocus;
end;


procedure TMain_Form.BitBtn5Click(Sender: TObject);
begin
  popupmenu3.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TMain_Form.FormShow(Sender: TObject);
var
  i:integer;
  item:TMenuItem;
begin
  fieldname:='CUT_NO';
  if dm.ADOConnection1.Connected then
  begin
      with dm.adoquery1 do
      begin
        close;
        sql.Text:='select getdate() as sys_date';
        open;
        dtpk2.Date:=DateOf(fieldvalues['sys_date']);
        self.sys_longdate:=
        formatdatetime('yyyy-mm-dd HH:mm:ss',fieldvalues['sys_date']);
        dtpk1.Date:=dtpk2.Date-30;
        self.DTPK1Click(sender);
        dm.ADS492.Open;
  end;
  PreColumn := DBGridEh1.Columns[0];

  for i:=1 to DBGridEh1.Columns.Count do
  begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGridEh1.Columns[i-1].Title.Caption ;

    if DBGridEh1.Columns[i-1].Visible then
        item.Checked := true ;
        item.OnClick := item_click ;
        self.PopupMenu3.Items.Add(item) ;
  end;
 end;
end;


procedure TMain_Form.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := true ;
                      break ;
                  end ;
      end
  else
      begin
          for i := 0 to DBGridEh1.FieldCount - 1 do
              if DBGridEh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
                  begin
                      DBGridEh1.Columns[i].Visible := false ;
                      break ;
                  end ;
      end ;
end;


//全部确认
procedure TMain_Form.N4Click(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    showmsg('你只有检查权限，不能做其他操作',1);
    Exit;
  end;
  if DM.ADS492if_control.AsBoolean then
  if not DM.checkbomqry(DM.ADS492bom_ptr.AsInteger) then
  begin
    ShowMessage('该项目为管控项目，你当前的权限不允许操作该项目');
    Exit;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='update data0492 '
      + 'set con_user_ptr= ' + user_ptr + ', con_date= ' + QuotedStr(self.sys_longdate)
      + ' where rkey=' + dm.ADS492rkey.AsString;
    ExecSQL;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='update data0468 set STATUS=0 '
      + 'where CUT_NO= ' + QuotedStr(dm.ADS492CUT_NO.Value)
      + 'and status= 2 and  QUAN_ISSUED <= 0';
    ExecSQL;
  end;
  self.BitBtn3Click(sender);
end;


procedure TMain_Form.N5Click(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    showmsg('你只有检查权限，不能做其他操作', 1);
    Exit;
  end;
  if DM.ADS492if_control.AsBoolean then
  if not DM.checkbomqry(DM.ADS492bom_ptr.AsInteger) then
  begin
    ShowMessage('该项目为管控项目，你当前的权限不允许操作该项目');
    Exit;
  end;
  {if dm.ADS468QUAN_ISSUED.AsFloat >0 then
  begin
    showmsg('本单已被发放，不可以取消!', 1);
    Exit;
  end;}
  if application.MessageBox('是否确定取消？', '提示', mb_yesno)=idyes then
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='update data0468 set STATUS = 2 '
        + 'where CUT_NO= ' + QuotedStr(dm.ADS492CUT_NO.Value) + ' and status= 0 and QUAN_ISSUED <=0';   //0
      ExecSQL;
    end;
  end;
  self.BitBtn3Click(sender);
end;

procedure TMain_Form.DBGridEh2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (chr(key)='V') and (ssalt in shift) then
  showmsg(dm.ADS468.CommandText,1);
end;

procedure TMain_Form.PopupMenu2Popup(Sender: TObject);
begin
  if  dm.ADS468.RecordCount=0 then
  begin
    self.N7.Enabled := false;
    self.N1.Enabled := false;
    self.N2.Enabled := false;
    Exit;
  end;

  with dm.ADOQuery1 do
  begin
    close;
    sql.Text:='select STATUS,QUAN_ISSUED  from data0468 '
      + 'where rkey= ' + dm.ADS468rkey.AsString ;
    open;
  end;
  if dm.ADOQuery1.FieldByName ('QUAN_ISSUED').AsFloat > 0 then
  begin
    self.N7.Enabled := false;
    self.N1.Enabled := false;
    self.N2.Enabled := false;
  end;
  if (dm.ADOQuery1.FieldByName ('STATUS').AsInteger = 2) and (dm.ADOQuery1.FieldByName ('QUAN_ISSUED').AsFloat <= 0) then
  begin
    self.N7.Enabled := true;
    self.N1.Enabled := false;
    self.N2.Enabled := true;
  end;
  if (dm.ADOQuery1.FieldByName ('STATUS').AsInteger = 0) and (dm.ADOQuery1.FieldByName ('QUAN_ISSUED').AsFloat <= 0) then
  begin
    self.N7.Enabled := false;
    self.N1.Enabled := true;
    self.N2.Enabled := false;
  end;
end;

procedure TMain_Form.PopupMenu1Popup(Sender: TObject);
var
  i: Integer;
begin
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text := 'select STATUS, QUAN_ISSUED from data0468 '
        + ' where CUT_NO = ' + QuotedStr(dm.ADS492CUT_NO.Value);
      open;
      if not IsEmpty then
      begin
        First;
        for i := 0 to RecordCount - 1 do
        begin
          if FieldByName('QUAN_ISSUED').AsInteger > 0 then
          begin
            N5.Enabled := False;
            N4.Enabled := False;
            N6.Enabled := False;
          end;
          if (FieldByName('STATUS').AsInteger = 0) and (FieldByName('QUAN_ISSUED').AsInteger <= 0) then  //未发料有效的
          begin
            N5.Enabled := True;
            N4.Enabled := False;
            N6.Enabled := False;
          end;
          if (FieldByName('STATUS').AsInteger = 2) and (FieldByName('QUAN_ISSUED').AsInteger <= 0) then  //未发料待确认的
          begin
            N5.Enabled := False;
            N4.Enabled := True;
            N6.Enabled := True;
          end;
          Next;
        end;
      end;
    end;
  end;
end;


procedure TMain_Form.N7Click(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    showmsg('你只有检查权限，不能做其他操作',1);
    Exit;
  end;
  with dm.ADOQuery1 do
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='update data0468'+#13+
      'set STATUS=0'+#13+
      'where RKEY='''+dm.ADS468RKEY.AsString+'''';
      ExecSQL;
    end;

    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='update data0492 '+#13+
      'set con_user_ptr= '+ user_ptr + ',' +
      'con_date= '''+self.sys_longdate+''''+#13+
      'where rkey='+dm.ADS492rkey.AsString;
      ExecSQL;
    end;
  end;
  self.BitBtn3Click(sender);
end;

procedure TMain_Form.N1Click(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    showmsg('你只有检查权限，不能做其他操作',1);
    Exit;
  end;
  if  dm.ADS468QUAN_ISSUED.AsFloat >0 then
  begin
    showmsg('本单已有发放记录，不可以取消!',1);
  end
  else
  if application.MessageBox('是否确定取消','提示',mb_yesno)=idyes then
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='update data0468'+#13+
      'set STATUS=2'+#13+
      'where RKEY='''+dm.ADS468RKEY.AsString+'''';
      ExecSQL;
    end;
  end;
  self.BitBtn3Click(sender);
end;

procedure TMain_Form.N6Click(Sender: TObject);
var
  i, j: Integer;
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    showmsg('你只有检查权限，不能做其他操作', 1);
    Exit;
  end;
  if DM.ADS492if_control.AsBoolean then
  if not DM.checkbomqry(DM.ADS492bom_ptr.AsInteger) then
  begin
    ShowMessage('该项目为管控项目，你当前的权限不允许操作该项目');
    Exit;
  end;
  if application.MessageBox('是否确定退回？', '提示', mb_yesno)=idyes then
  begin
    with dm.ADOQuery1 do   //退回有效并且没有发放的配料单
    begin
      Close;
      Sql.Text := 'update data0468 set STATUS = 3 '
        + 'where CUT_NO= ' + QuotedStr(dm.ADS492CUT_NO.Value) + ' and status = 2 and QUAN_ISSUED <= 0';
      ExecSQL;
    end;
  end;
  
  self.BitBtn3Click(sender);
end;

procedure TMain_Form.N2Click(Sender: TObject);
begin
  if (vprev = '1') or (vprev = '3') then
  begin
    showmsg('你只有检查权限，不能做其他操作',1);
    Exit;
  end;
  if  dm.ADS468QUAN_ISSUED.AsFloat >0 then
  begin
    showmsg('本单已有发放记录，不可以退回!',1);
  end
  else
  if application.MessageBox('是否确定退回？','提示',mb_yesno)=idyes then
  begin
    with dm.ADOQuery1 do
    begin
      close;
      sql.Text:='update data0468'+#13+
      'set STATUS=3'+#13+
      'where RKEY='''+dm.ADS468RKEY.AsString+'''';
      ExecSQL;
    end;
  end;
  self.BitBtn3Click(sender);
end;

procedure TMain_Form.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if application.MessageBox('真的要退出此程序吗？','提示',mb_yesno)=idno then
  begin
      canclose := false;
  end;
end;

procedure TMain_Form.DBGridEh2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
  If DM.ADS468QUAN_ISSUED.Value > 0 then
  Begin
      DBGridEh2.Canvas.Font.Color := clRed;
      DBGridEh2.DefaultDrawColumnCell(Rect, DataCol, Column, [gdFixed,gdFocused,gdSelected]);
  End;
end;

procedure TMain_Form.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,state);
  end;
end;

procedure TMain_Form.DBGridEh2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then
   Background := cl3DLight;
end;

end.
