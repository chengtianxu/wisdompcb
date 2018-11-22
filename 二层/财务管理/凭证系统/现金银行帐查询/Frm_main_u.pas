unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, StdCtrls, Spin, ComCtrls, ToolWin, ImgList,Excel2000,ComObj,
  ExtCtrls, DB,math;

type
  TFrm_main = class(TForm)
    TV: TTreeView;
    Splitter1: TSplitter;
    Panel1: TPanel;
    Panel2: TPanel;
    BtImageList: TImageList;
    ToolBar1: TToolBar;
    BTXls: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    BtClose: TToolButton;
    Label1: TLabel;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    Label3: TLabel;
    CheckBox1: TCheckBox;
    DBGridEh1: TDBGridEh;
    ImageList2: TImageList;
    DS: TDataSource;
    CheckBox2: TCheckBox;
    procedure BtCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TVGetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure TVChange(Sender: TObject; Node: TTreeNode);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BTXlsClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure TVClick(Sender: TObject);
  private
    FY,FM:integer;
    procedure init;
    procedure DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
       Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
 uses DM_u,AcctNote,common;
{$R *.dfm}

procedure TFrm_main.BtCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFrm_main.init;
var node1:TTreeNode;
begin
   DM.ADOCon.Open;
   DM.Tmp1.close;
   DM.Tmp1.SQL.Text:='SELECT Rkey, isnull(PARENT_PTR,9999) PARENT ,GL_ACC_NUMBER+'' ''+GL_DESCRIPTION nm, TTYPE, GL_ACC_NUMBER, GL_DESCRIPTION '+
                'FROM Data0103 where GL_ACC_NUMBER<''10029999''  order by GL_ACC_NUMBER';
   DM.Tmp1.Open;
   node1:=TV.Items.AddChild(nil,'All');
   pAnds(TV,DM.Tmp1,node1,9999);
   TV.FullExpand;


   DM.Tmp1.close;
   DM.Tmp1.SQL.Text:='select curr_FYEAR,curr_period from data0508' ;
   DM.Tmp1.Open;
   FY:=DM.Tmp1.Fields[0].AsInteger;
   FM:=DM.Tmp1.Fields[1].AsInteger;
   SpinEdit1.Value:=FY;
   SpinEdit2.Value:=FM;
   SpinEdit3.Value:=FM;

   SpinEdit1.MaxValue:=FY;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
begin
    if not App_Init(DM.ADOCon ) then
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

procedure TFrm_main.TVGetImageIndex(Sender: TObject; Node: TTreeNode);
begin
  if Node.HasChildren then Node.ImageIndex:=23 else Node.ImageIndex:=22
end;

procedure TFrm_main.TVGetSelectedIndex(Sender: TObject; Node: TTreeNode);
begin
  node.SelectedIndex:=0;
end;

procedure TFrm_main.TVChange(Sender: TObject; Node: TTreeNode);
var ok:string;
begin
  DM.ADOCashQry.Close;
  if spinedit2.Value>spinedit3.Value then
  begin
   showmessage('开始期间不能大于结束期间!');
   spinedit2.SetFocus;
   abort;
  end;
  if spinedit1.Value=FY then
  if spinedit2.Value>FM then
  begin
   showmessage('开始期间不能大于当前会计期间!');
   spinedit2.SetFocus;
   abort;
  end;

  if Node.HasChildren then  exit;
  Screen.Cursor := crSQLWait;
  if CheckBox1.Checked then ok:='1' else ok:='0' ;
  DM.ADOCashQry.SQL.Text:='exec CashQry '+inttostr(integer(Node.Data^)) +','+inttostr(SpinEdit1.Value)+','+inttostr(SpinEdit2.Value)+','+inttostr(SpinEdit3.Value)+','+ok;
  DM.ADOCashQry.Open;
  Screen.Cursor := crDefault;
end;

procedure TFrm_main.DrawDBGridEHColorCol(DBGridEHName: TDBGridEH;
  Rect: TRect; DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
begin
 if DBGridEHName.DataSource.DataSet.FieldByName('DESCRIPTION').Value='本日合计' then
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
  DrawDBGridEHColorCol((Sender as TDBGRidEH),Rect,DataCol,Column,State);
end;

procedure TFrm_main.DBGridEh1DblClick(Sender: TObject);
begin
 if DM.ADOCashQry .FieldByName('voucher').asstring<>'' then
 try
  Application.CreateForm(TFrmAcctNote, FrmAcctNote);


  dm.Qry105_106.close;
  dm.Qry105_106.Parameters.ParamByName('vVoucher').Value :=DM.ADOCashQry .FieldByName('voucher').asstring;
  dm.Qry105_106.Open ;

  FrmAcctNote.Edit6.text:=DM.Qry105_106.FieldByName('voucher').asstring;
  FrmAcctNote.datetimepicker1.DateTime :=DM.Qry105_106.fieldbyname('ENTERED_DT').asdatetime;
  FrmAcctNote.edit5.Text:=DM.Qry105_106.fieldbyname('attached').asstring;
  FrmAcctNote.edit1.Text:=DM.Qry105_106.fieldbyname('FYEAR').asstring;
  FrmAcctNote.edit4.Text:=DM.Qry105_106.fieldbyname('PERIOD').asstring;
  FrmAcctNote.edit7.Text:=DM.Qry105_106.fieldbyname('EMPLOYEE_NAME').asstring;


  DM.Qry105_106.First ;
  with DM.Qry105_106 do
  while not eof do
  begin
    FrmAcctNote.stringgrid1.RowCount:=FrmAcctNote.stringgrid1.RowCount+1;
    FrmAcctNote.stringgrid1.Cells[0,FrmAcctNote.stringgrid1.RowCount-2]:=
      Fieldbyname('description').asstring;
    FrmAcctNote.stringgrid1.Cells[1,FrmAcctNote.stringgrid1.RowCount-2]:=
      trim(Fieldbyname('gl_acc_number').asstring)+'-'+
      Fieldbyname('GL_DESCRIPTION').asstring;

    FrmAcctNote.stringgrid1.Cells[2,FrmAcctNote.stringgrid1.RowCount-2]:=
             Fieldbyname('CURR_CODE').asstring;
    FrmAcctNote.stringgrid1.Cells[3,FrmAcctNote.stringgrid1.RowCount-2]:=
                   Fieldbyname('EXCH_RATE').AsString;

    FrmAcctNote.stringgrid1.Cells[4,FrmAcctNote.stringgrid1.RowCount-2]:=
                              Fieldbyname('orig_amount').AsString;

    if UpperCase(Fieldbyname('d_c').asstring)='D' then
      FrmAcctNote.stringgrid1.Cells[5,FrmAcctNote.stringgrid1.RowCount-2]:=
       Fieldbyname('AMOUNT').asstring
    else
      FrmAcctNote.stringgrid1.Cells[6,FrmAcctNote.stringgrid1.RowCount-2]:=
       Fieldbyname('AMOUNT').asstring;
    next;
  end;

  FrmAcctNote.ttype.Caption :='2';
  FrmAcctNote.showmodal;
  dm.Qry105_106.close;
 finally
   FrmAcctNote.free;;
 end;
end;

procedure TFrm_main.BTXlsClick(Sender: TObject);
var
 iCount, jCount, v_cloumn: Integer;
 XLApp: Variant;
 Sheet: oleVariant;
begin
 if not DM.ADOCashQry.Active  then exit;
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

 begin
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

   Sheet.Cells[1, v_cloumn] :='日记帐'+TV.Selected.Text;

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
         Sheet.Cells[jCount, iCount + 1 - v_cloumn] :=
           TDBGrideh(DBGrideh1).Columns.Items[iCount].Field.AsString;
        end
      else
       inc(v_cloumn);
       Inc(jCount);
     TDBGrideh(DBGrideh1).DataSource.DataSet.Next;
   end;
   XlApp.Visible := True;
   TDBGrideh(DBGrideh1).DataSource.DataSet.EnableControls;
 end;
 Screen.Cursor := crDefault;
end;

procedure TFrm_main.CheckBox2Click(Sender: TObject);
begin
  DBGridEh1.Columns[5].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[6].Visible:=checkbox2.Checked;
  DBGridEh1.Columns[7].Visible:=checkbox2.Checked;
end;

procedure TFrm_main.TVClick(Sender: TObject);
begin
  if TV.Selected<>nil then
    TVChange(Sender,TV.Selected);
end;

end.
