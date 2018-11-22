unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Spin, ExtCtrls, Grids, DBGridEh,DateUtils, DB,Excel2000,
  ClipBrd, ComObj,math, Menus;

type
  TFrm_main = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    SpeedButton4: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton1: TSpeedButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    SpinEdit4: TSpinEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn4: TBitBtn;
    BitBtn3: TBitBtn;
    DS: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure Edit1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    FsY,FsM:string;
    FiColor:integer;
    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
       Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure glAccNo(edt:TEdit);
    procedure init;
    function get_accname(acc_number:string):string;
  public

    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
 uses DM_u,AcctSearch,ufrmGl,common, uDLShow;
{$R *.dfm}


procedure TFrm_main.FormCreate(Sender: TObject);
begin
    if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
  end;
  Caption := application.Title;
   
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

//  DM.ADOCon.Open;
  init;
end;

procedure TFrm_main.Edit1Exit(Sender: TObject);
begin
  if trim(Tedit(sender).text)='' then exit;
  DM.Tmp1.close;
  DM.Tmp1.SQL.Text:='SELECT gl_acc_number from data0103 where gl_acc_number='+quotedstr(trim(Tedit(sender).text))+
                       ' and ttype <= '+inttostr(spinedit4.Value-1);
  DM.Tmp1.open;
  if DM.Tmp1.RecordCount =0 then
  begin
    messagedlg('科目代码不正确!',mtinformation,[mbok],0);
    Tedit(sender).SetFocus ;
    abort;
  end;
end;

procedure TFrm_main.init;
begin

  DM.Qry508.Open;
  FsY:=DM.Qry508.fieldbyname('curr_FYEAR').asstring;
  FsM:=DM.Qry508.fieldbyname('curr_period').asstring;
  spinedit1.MaxValue :=strtoint(FsY);

  spinedit1.text:=FsY;
  spinedit2.text:='1';
  spinedit3.text:=FsM;
  FiColor:=2;
end;

procedure TFrm_main.glAccNo(edt: TEdit);
var i,iL:integer;
    sGLno: string;
begin
  iL:=0;
  for i:=1 to strtoint(spinedit4.Text) do
    iL:=iL+DM.Qry508.fieldbyname('class'+inttostr(i)).AsInteger;
  if TFrmAcctSearch.getGL_AccNo(iL,sGLno) then  edt.Text:=sGLno;
end;


procedure TFrm_main.BitBtn4Click(Sender: TObject);
begin
  glAccNo(Edit1);
end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
begin
  glAccNo(Edit2);
end;

procedure TFrm_main.SpeedButton2Click(Sender: TObject);

begin
  if (trim(Edit1.Text)='') or (trim(Edit2.Text)='') then
   begin
    messagedlg('请输入科目代码范围!',mtinformation,[mbok],0);
    exit;
   end;
  if spinedit2.Value>spinedit3.Value then
  begin
   showmessage('开始期间不能大于结束期间!');
   spinedit2.SetFocus;
   exit;
  end;

 if spinedit1.Value=DM.Qry508.fieldbyname('curr_FYEAR').AsInteger then
 if spinedit2.Value>DM.Qry508.fieldbyname('curr_period').AsInteger then
  begin
   showmsg('开始期间不能大于当前会计期间!',1);
   spinedit2.SetFocus;
   exit;
  end;
  
  FiColor:=(spinedit3.Value-spinedit2.Value+1)*2+1;
  Screen.Cursor := crHourGlass;
  DM.ADOGLQry.Close;
  DM.ADOGLQry.SQL.Text:='exec GLQry '+inttostr(SpinEdit4.Value-1)+','''+Edit1.Text+''','''+Edit2.Text+''','+inttostr(SpinEdit1.Value)+','+inttostr(SpinEdit2.Value)+','+inttostr(SpinEdit3.Value);
  DM.ADOGLQry.Open;
  Screen.Cursor := crDefault;
end;

procedure TFrm_main.SpeedButton1Click(Sender: TObject);
begin
  close;
  application.Terminate;
end;

procedure TFrm_main.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
   if DBGridEHName.DataSource.DataSet.RecNo  mod Ficolor=0 then
   begin
        DBGridEHName.Canvas.Brush.Color:=$008ABAEE;
        DBGridEHName.Canvas.FillRect(rect);
        DBGridEHName.Canvas.font.color:=clblack;
   end else
   if  DBGridEHName.DataSource.DataSet.RecNo  mod 2=0 then
   begin
        DBGridEHName.Canvas.Brush.Color:=clinfobk;
        DBGridEHName.Canvas.FillRect(rect);
        DBGridEHName.Canvas.font.color:=clblack;
   end
   else
   begin
        DBGridEHName.Canvas.Brush.Color:=clwhite;
        DBGridEHName.Canvas.FillRect(rect);
        DBGridEHName.Canvas.font.color:=clblack;
   end;

   if ((State = [gdSelected]) or (State=[gdSelected,gdFocused])) then
   begin
      DBGridEHName.Canvas.Brush.Color:=RGB(0,224,224);
      DBGridEHName.Canvas.FillRect(rect);
      DBGridEHName.Canvas.font.color:=clblack;
   end;
   DBGridEHName.DefaultDrawColumnCell(rect,datacol,column,state);  
end;

procedure TFrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
// if not (gdFixed in State) then
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TFrm_main.SpeedButton4Click(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: Variant;
begin
 if not DM.ADOGLQry.Active or (DM.ADOGLQry.RecordCount=0) then exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
   try
     XLApp := CreateOleObject('Excel.Application');
   except
     Screen.Cursor := crDefault;
     Exit;
   end;
   XLApp.WorkBooks.Add;
   XLApp.SheetsInNewWorkbook := 1;
   XLApp.WorkBooks[1].WorkSheets[1].Name := self.Caption;
   Sheet := XLApp.Workbooks[1].WorkSheets[self.Caption];
   if not TDBGrideh(self.DBGrideh1).DataSource.DataSet.Active then
     begin
      Screen.Cursor := crDefault;
      Exit;
     end;
   TDBGrideh(DBGrideh1).DataSource.DataSet.DisableControls;
   TDBGrideh(DBGrideh1).DataSource.DataSet.first;
   v_cloumn:=TDBGrideh(DBGrideh1).Columns.Count;
   v_cloumn:=Floor(v_cloumn/2);

   Sheet.Cells[1, v_cloumn] :='总分类帐';

   Sheet.Cells[1, v_cloumn].Font.bold := True;
   Sheet.Cells[1, v_cloumn].Font.Size := 16;

   Sheet.Cells[2, v_cloumn+1] :='会计期间:'+SpinEdit1.Text+'年'+SpinEdit2.Text +'月到'+SpinEdit3.Text+'月';
   Sheet.Cells[2, v_cloumn+1].Font.bold := True;
   v_cloumn:=0;
   //列头
   for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
     if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
       begin
        Sheet.Cells[3, iCount + 1 - v_cloumn] :=
         TDBGrideh(DBGrideh1).Columns.Items[iCount].Title.Caption;
        Sheet.Cells[3, iCount + 1 - v_cloumn].Font.bold := True;
       end
     else
      inc(v_cloumn);
   jCount := 4;
   //行
   while not TDBGrideh(DBGrideh1).DataSource.DataSet.Eof do
     begin
      v_cloumn:=0;
      for iCount := 0 to TDBGrideh(DBGrideh1).Columns.Count - 1 do
       if TDBGrideh(DBGrideh1).Columns.Items[iCount].Visible=true then
         begin
          // if v_cloumn=2 then
            // Sheet.Cells[jCount, iCount + 1 - v_cloumn].NumberFormatLocal:='"@"';

          //  Range("D15").Select
          //  Selection.NumberFormatLocal = "@"

          Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=TDBGrideh(DBGrideh1).Columns.Items[iCount].Field.AsString;

         end
       else
        inc(v_cloumn);
      Inc(jCount);
      TDBGrideh(DBGrideh1).DataSource.DataSet.Next;
     end; //end while
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;

 Screen.Cursor := crDefault;
end;

procedure TFrm_main.SpeedButton3Click(Sender: TObject);
begin
popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.DBGridEh1DblClick(Sender: TObject);
begin

 if (dm.ADOGLQry.FieldByName('has_child').AsInteger=0) and
    (dm.ADOGLQry.RecNo  mod Ficolor <> 0) then
 try
  Application.CreateForm(TFrmDLShow, FrmDLShow);

  FrmDLShow.Edit1.Text:=SpinEdit1.Text;
  FrmDLShow.Edit2.Text:=dm.ADOGLQry.FieldByName('period').AsString;
  FrmDLShow.Edit3.Text:=dm.ADOGLQry.FieldByName('period').AsString;

  FrmDLShow.ShowModal;

 finally
  FrmDLShow.Free;
 end;
end;

function TFrm_main.get_accname(acc_number: string): string;
begin
  DM.Tmp1.close;
  DM.Tmp1.SQL.Text:='SELECT GL_DESCRIPTION from data0103 where gl_acc_number='+quotedstr(acc_number);;
  DM.Tmp1.open;
  if not dm.Tmp1.IsEmpty then
  Result :=acc_number+';'+dm.Tmp1.fieldbyname('GL_DESCRIPTION').AsString
  else
  Result:='';
end;

procedure TFrm_main.N1Click(Sender: TObject);
begin
  if not DM.ADOGLQry.Active or (DM.ADOGLQry.RecordCount=0) then
  else
  with TfrmGL.create(application) do
  begin
    DataSource1.DataSet :=DM.ADOGLQry;
    ppReport1.Reset;
    ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'glrpt.rtm';    //R:\NIERP\Report\glrpt.rtm
    ppReport1.Template.LoadFromFile;
    ppReport1.SaveAsTemplate:=false;
    ppLabel10.Caption:=spinedit1.Text;
    ppLabel16.Caption:=get_accname(Edit1.Text);
    ppreport1.print;
    free;
  end;
end;

procedure TFrm_main.N3Click(Sender: TObject);
begin
  with TfrmGL.create(application) do
  begin
    DataSource1.DataSet :=DM.ADOGLQry;
    ppReport1.Reset;
    ppReport1.Template.FileName :=
    stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
      'glrpt.rtm';    //R:\NIERP\Report\glrpt.rtm
    ppReport1.Template.LoadFromFile;
    ppReport1.SaveAsTemplate:=true;
    ppDesigner1.ShowModal;
    free;
  end;
end;


end.
