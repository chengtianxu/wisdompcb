unit SingleDataSet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Toolbar, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinsdxBarPainter,   DB,
  DBClient, cds,  SqlExpr, ActnList, ImgList, dxBar, dxBarExtItems,
  cxClasses, dxStatusBar, dxSkinscxPCPainter, cxContainer, cxEdit,
  ppEndUsr,  ppProd, ppClass, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe,  DBGridEh, StdCtrls, ExtCtrls, RzPanel,
  ToolWin, ComCtrls, cxGroupBox, cxPC,ADODB, Provider,
  ppBands, ppPrnabl, ppCtrls, ppCache, Grids, Mask, DBCtrls, DBEditBit,
  ToolCtrlsEh, RzEdit, RzDBEdit, RzDBBnEd,DBButtonEdit, Menus; 

type
  TSingleDataSet_f = class(TToolbar_f)
    dlgOpen1: TOpenDialog;
    cxTabControl1: TcxTabControl;
    Panel3: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    cxPageControl2: TcxPageControl;
    cxTabSheet0: TcxTabSheet;
    ToolBar2: TToolBar;
    DghMain: TDBGridEh;
    cxTabSheet1: TcxTabSheet;
    RzToolbar1: TRzToolbar;
    Button1: TButton;
    Panel7: TPanel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N_SeeLog: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure actFirstExecute(Sender: TObject);
    procedure actPriorExecute(Sender: TObject);
    procedure actNextExecute(Sender: TObject);
    procedure actLastExecute(Sender: TObject);
    procedure actRefreshExecute(Sender: TObject);
    procedure actExportExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actDesignExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure DghMainGetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DghMainDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure DghMainKeyPress(Sender: TObject; var Key: Char);
    procedure DghMainEnter(Sender: TObject);
    procedure DghMainTitleClick(Column: TColumnEh);
    procedure cdsMainReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
    procedure dsMainStateChange(Sender: TObject);
    procedure cdsMainAfterScroll(DataSet: TDataSet);
    procedure cdsMainBeforeScroll(DataSet: TDataSet);
    procedure cdsMainAfterDelete(DataSet: TDataSet);
    procedure DghMainKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure actAddExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure cdsMainBeforeClose(DataSet: TDataSet);
    procedure cdsMainAfterInsert(DataSet: TDataSet);
    procedure cdsMainAfterCancel(DataSet: TDataSet);
    procedure cdsMainBeforeCancel(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure N1Click(Sender: TObject);
    procedure N_SeeLogClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure N3Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    ResetColumnsGrid:array of string;
    ActiveGridEH:TDBGridEh;
    ReportFileName:string;
    procedure RightsSetDataSetReadOnly;  override;
    function SaveBeforeCheck():Boolean;  override;
    function SaveData():Boolean;         override;
    function DeleteSaveData():Boolean;   override;
    procedure SetToolbarButtonStatus(Flag:Boolean);override;
  public
    
    { Public declarations }
  end;

var
  SingleDataSet_f: TSingleDataSet_f;

implementation

uses PublicFile, DM_f,  ColsDisplaySet_unt, LogWriteform;

{$R *.dfm}

procedure TSingleDataSet_f.RightsSetDataSetReadOnly;
begin
  if (StrToInt(vprev) in [2,3,4]) then
  begin
    cdsMain.ReadOnly:=False;
    DghMain.ReadOnly:=False;
  end
  else
  begin
    cdsMain.ReadOnly:=True;
    DghMain.ReadOnly:=True;
  end;
end;

function TSingleDataSet_f.SaveBeforeCheck():Boolean;
var
  strMsg:string;
begin
  Result:=True;
  with cdsMain do
  begin
    if State in [dsEdit ,dsInsert] then     //usModified
    Post;
//    if FieldByName('number').IsNull then //申领单号
//      strMsg:=strMsg+'字段：“'+FieldByName('number').DisplayLabel+'”的值不能为空！！！'+#13;
  end;

  if strMsg<>'' then
  begin
    MsgError(Copy(strMsg,0,Length(strMsg)-1));
    Result:=False;
  end;
end;

function TSingleDataSet_f.SaveData():Boolean;
var
  i:Integer;
  str_SQL:string;
begin
  Result:=False;
  with cdsMain do
  begin
    try
      Screen.Cursor := crHourGlass;
      if State in [dsEdit,dsInsert] then
        Post;
    
      if ChangeCount >0 then
      if SaveBeforeCheck then
      begin
        if (IsLog)then
        if Log_Add(Data_Info)=False  then
          Exit;
        try
          DM.ADOConnection1.BeginTrans;
          if ApplyUpdates(0)=0 then
          begin
            if IsLog then
            begin
              if Log_Save() then
              begin
                DM.ADOConnection1.CommitTrans;    //出口1
                Result:=True;
              end
              else
              begin
                DM.ADOConnection1.RollbackTrans;
              end;
            end
            else
            begin
              DM.ADOConnection1.CommitTrans;         //出口2
              Result:=True;
            end;
          end
          else
          begin
            DM.ADOConnection1.RollbackTrans;
          end;

          begin
            dsMainStateChange(dsMain);
            dxStatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
          end;
        except
          if DM.ADOConnection1.InTransaction then
            DM.ADOConnection1.RollbackTrans;
        end;
      end;
    finally
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TSingleDataSet_f.SetToolbarButtonStatus(Flag: Boolean);
begin
  with cdsMain   do
  begin
    dxBarManager.LockUpdate:=True;

    tblAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);
    actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);

    if ((State  in [dsEdit,dsInsert])or(ChangeCount>0))  then
      begin
        tblSave.Enabled:=True and(StrToInt(vprev)in [2,4]);
        actSave.Enabled:=True and(StrToInt(vprev)in [2,4]);
        tblCancel.Enabled:=True;
        actCancel.Enabled:=True;
        tblfind.Enabled:=False;
        actFind.Enabled:= False;
        tblRefresh.Enabled:=False;
        actRefresh .Enabled:= False;
        tblExport.Enabled:=False;
        actExport.Enabled:=False; //导出
        tblExit.Enabled:=False;   //退出
        tblPrint.Enabled:= False;      //打印
        tblDesign.Enabled:=False ;      //报表设计
        tblFilter.Enabled:= False;
        tblReject.Enabled:=False ;   //反提交
        tblExpand.Enabled:=False ;   //提交
        tblConfirm.Enabled:=False;   //审核
        tblUConfirm.Enabled:=False;  //反审核
      end
    else
      begin
        tblSave.Enabled:=False;
        actSave.Enabled:=False;
        tblCancel.Enabled:=False;
        actCancel.Enabled:=False;
        tblfind.Enabled:= True;
        actFind.Enabled:= True;
        tblRefresh .Enabled:=True;
        actRefresh .Enabled:=True;
        tblExport.Enabled:=True  and(StrToInt(vprev)in [2,4]);
        actExport.Enabled:=True  and(StrToInt(vprev)in [2,4]);
        tblExit.Enabled:=True;
        tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,4]);      //打印
        tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;      //报表设计
        tblFilter.Enabled:= True;
        tblReject.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //反提交
        tblExpand.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //提交
        tblConfirm.Enabled:=True  and (StrToInt(vprev)in [2,4]);   //审核
        tblUConfirm.Enabled:=True and (StrToInt(vprev)in [2,4]);  //反审核
      end ;
  end;

  with cdsMain do
  begin
    if Eof  then
    begin
    tblNext.Enabled:=False ;
    tblLast.Enabled:=False ;
    end
    else
    begin
    tblNext.Enabled:=True ;
    tblLast.Enabled:=True ;
    end;

    if  Bof  then
    begin
    tblPrior.Enabled:=False     ;
    tblFirst.Enabled:=False     ;
    end
    else
    begin
    tblPrior.Enabled:=True     ;
    tblFirst.Enabled:=True     ;
    end;
  end;

  if tblExit.Enabled then
     actClose.ImageIndex:=102
  else
     actClose.ImageIndex:=107;

  if tblAdd.Enabled then
     actAdd.ImageIndex:=3
  else
     actAdd.ImageIndex:=58;

  if tblEdit.Enabled then
     actEdit.ImageIndex:=4
  else
     actEdit.ImageIndex:=62;

  if tblSave.Enabled then
     actSave.ImageIndex:=137
  else
     actSave.ImageIndex:=60; // 60

  if tblCancel.Enabled then
     actCancel.ImageIndex:=5
  else
     actCancel.ImageIndex:=55;

  if tblDelete.Enabled then
     actDelete.ImageIndex:=6
  else
     actDelete.ImageIndex:=57;

  if tblFind.Enabled then
     actFind.ImageIndex:=17
  else
     actFind.ImageIndex:=64;

  if tblRefresh.Enabled then
     actRefresh.ImageIndex:=103
  else
     actRefresh.ImageIndex:=106;

  if tblFirst.Enabled then
     actFirst.ImageIndex:=99
  else
     actFirst.ImageIndex:=96;

  if tblPrior.Enabled then
     actPrior.ImageIndex:=95
  else
     actPrior.ImageIndex:=94;

  if tblNext.Enabled then
     actNext.ImageIndex:=100
  else
     actNext.ImageIndex:=101;

  if tblLast.Enabled then
     actlast.ImageIndex:=97
  else
     actLast.ImageIndex:=98;

  if tblDesign.Enabled then
     actDesign.ImageIndex:=127
  else
     actDesign.ImageIndex:=132;

  if tblExpand.Enabled then
     actExpand.ImageIndex:=131
  else
     actExpand.ImageIndex:=135;


  if tblReject.Enabled then
     actReject.ImageIndex:=130
  else
     actReject.ImageIndex:=136;

  if tblPrint.Enabled then
     actPrint.ImageIndex:=19
  else
     actPrint.ImageIndex:=66;

  if tblExport.Enabled then   //导出EXCEL按钮
     actExport.ImageIndex:=119
  else
     actExport.ImageIndex:=120;

  if tblCancelFilter.Enabled then
     actCancelFilter.ImageIndex:= 128
  else
     actCancelFilter.ImageIndex:=133;

  if tblFilter.Enabled then
     actFilter.ImageIndex:=    129
  else
     actFilter.ImageIndex:= 134;

  if tblConfirm.Enabled then
     actConfirm.ImageIndex:=114
  else
     actConfirm.ImageIndex:= 116;

  if tblUConfirm.Enabled then
     actUConfirm.ImageIndex:=115
  else
     actUConfirm.ImageIndex:= 117;

  dxBarManager.LockUpdate:=False;
end;

function TSingleDataSet_f.DeleteSaveData():Boolean;
var
  s,i:integer;
begin
  Result:=True;
  with cdsMain  do
  if Active and (not IsEmpty) then
  if DeleteBeforeCheck then
  begin
    s:=messagebox(Self.Handle,'你确定要删除吗?删除后将不能恢复！','询问',MB_YESNO+MB_iconquestion) ;
    if S = idyes  then
    begin
      try
        Screen.Cursor := crHourGlass;
        with DghMain do
        begin
          if SelectedRows.Count >1 then  //如果用户选择的行数大于1，即多行。
          begin
            try
              F_IsBatchOperating:=True;  //如果选择的是多行，即多行一起删除，将状态FIsBatchOperating设置为真
              with   DataSource.DataSet   do
              for i:= SelectedRows.Count -1 downto 0 do
              begin
                GotoBookmark(pointer(SelectedRows.Items[i]));
                Delete;        //删除多行。
              end;
            finally
              F_IsBatchOperating:=False;   //删除结束后，复位
            end;
          end
          else
            DataSource.DataSet.Delete; //否则用户选择的是单行，删除。
        end ;
        if ApplyUpdates(0)>0 then
        Result:=True;
        dsMainStateChange(dsMain);
        dxStatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end;
end;

procedure TSingleDataSet_f.actDeleteExecute(Sender: TObject);
begin
  DeleteSaveData  ;
end;

procedure TSingleDataSet_f.actDesignExecute(Sender: TObject);
begin
  inherited;
  pp_Report1.Template.FileName :=
           stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ReportFileName;
  pp_Report1.Template.LoadFromFile;
  pp_Report1.SaveAsTemplate := True;
  pp_Designer1.ShowModal;
end;

procedure TSingleDataSet_f.actExportExecute(Sender: TObject);
begin
  OutputExcelStd(Self,DghMain);
end;

procedure TSingleDataSet_f.actFirstExecute(Sender: TObject);
begin
  inherited;
  cdsMain. First;

end;

procedure TSingleDataSet_f.actLastExecute(Sender: TObject);
begin
  inherited;
  cdsMain.Last;
end;

procedure TSingleDataSet_f.actNextExecute(Sender: TObject);
begin
  inherited;
  cdsMain.Next;
end;

procedure TSingleDataSet_f.actPrintExecute(Sender: TObject);
begin
  inherited;
  pp_Report1.Template.FileName :=
          stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ReportFileName;
  pp_Report1.Template.LoadFromFile;
  pp_Report1.SaveAsTemplate := false;
  pp_Report1.Print;
end;

procedure TSingleDataSet_f.actPriorExecute(Sender: TObject);
begin
  inherited;
  cdsMain.Prior;
end;

procedure TSingleDataSet_f.actRefreshExecute(Sender: TObject);
begin
  inherited;
  with cdsMain  do
  if Active then
  begin
    Refresh;
    cdsMainAfterScroll(cdsMain   ) ;
  end;
end;

procedure TSingleDataSet_f.actSaveExecute(Sender: TObject);
begin
  if SaveBeforeCheck then
    SaveData
  else
    Abort;
end;

procedure TSingleDataSet_f.cdsMainAfterDelete(DataSet: TDataSet);
begin
  inherited;
  if (DataSet as Tcds).F_IsBatchOperating=False then
    dsMainStateChange(dsMain);      //删除之后，改变工具条按钮的状态。
end;

procedure TSingleDataSet_f.cdsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
    with(DataSet as Tcds)   do    
    if (F_IsBatchOperating =False)and(DghMain.SelectedRows.Count<=1) then
    begin
      dxStatusBar1.Panels[0].Text:='当前记录行:'+IntToStr(RecNo)+'/总记录数:'+ IntToStr(RecordCount);
      begin
        dxBarManager.LockUpdate:=True;
        if  DataSet.Eof  then
        begin
          tblNext.Enabled:=False ;
          actNext.Enabled:=False ;
          tblLast.Enabled:=False ;
          actLast.Enabled:=False ;
        end
        else
        begin
          tblNext.Enabled:=True ;
          actNext.Enabled:=True ;
          tblLast.Enabled:=True ;
          actLast.Enabled:=True ;
        end;
        if  DataSet.Bof  then
        begin
          tblPrior.Enabled:=False     ;
          actPrior.Enabled:=False     ;
          tblFirst.Enabled:=False     ;
          actFirst.Enabled:=False     ;
        end
        else
        begin
          tblPrior.Enabled:=True     ;
          actPrior.Enabled:=True     ;
          tblFirst.Enabled:=True     ;
          actFirst.Enabled:=True     ;
        end;

        if tblFirst.Enabled then
           actFirst.ImageIndex:=99
        else
           actFirst.ImageIndex:=96;

        if tblPrior.Enabled then
           actPrior.ImageIndex:=95
        else
           actPrior.ImageIndex:=94;

        if tblNext.Enabled then
           actNext.ImageIndex:=100
        else
           actNext.ImageIndex:=101;

        if tblLast.Enabled then
           actlast.ImageIndex:=97
        else
           actLast.ImageIndex:=98;

        if tblDownload.Enabled then
          actDownload.ImageIndex:=0
        else
          actDownload.ImageIndex:=59 ;

        dxBarManager.LockUpdate:=False;
      end;
      dsMainStateChange(dsMain);
      SetButtonStatus;
    end;
end;

procedure TSingleDataSet_f.cdsMainBeforeScroll(DataSet: TDataSet);
begin
  inherited;
  if cdsMain.F_AutoSave then
  if cdsMain.F_IsBatchOperating=False then
  if (cdsMain.State  in [dsEdit,dsInsert])or(cdsMain.ChangeCount>0)then
  if cdsMain.F_IsCancel=False then
  begin
    if SaveBeforeCheck then
      SaveData
    else
      Abort;
  end;
end;

procedure TSingleDataSet_f.cdsMainReconcileError(DataSet: TCustomClientDataSet;
  E: EReconcileError; UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
  inherited;
  MsgError('保存失败，原因是：'+E.Message);
end;

procedure TSingleDataSet_f.DghMainDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  inherited;
  with  (Sender as TDBGridEh)do
  begin
    if ((State=[gdSelected]))then
      Canvas.Brush.Color:=clInactiveCaption;           //设置表格选定区域的颜色
    DefaultDrawColumnCell(Rect,datacol,Column,State);
  end;
end;

procedure TSingleDataSet_f.DghMainEnter(Sender: TObject);
begin
  inherited;
  DghReadOnlyFocus(Sender AS TDBGridEh);
end;

procedure TSingleDataSet_f.DghMainGetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  inherited;
  if (Sender as TDBGridEh).SumList.RecNo mod 2 = 1 then     // .SumList
   Background := $00FFC4C4;
end;

procedure TSingleDataSet_f.DghMainKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  KeyPressDBGridEH(Sender as TDBGridEh, key,self);
end;

procedure TSingleDataSet_f.DghMainTitleClick(Column: TColumnEh);
var
  OldIndex: string;
begin
  if ( Column.Field.DataType <> ftBlob)and(Column.Field.FieldKind=fkData) then
  with (Column.Grid.DataSource.DataSet as TClientDataSet) do   
  begin
    OldIndex:= IndexName;
    if OldIndex <> '' then
    begin
      IndexName:= '';
      DeleteIndex(OldIndex);
    end;
    case Column.Title.SortMarker of
      smNoneEh,
      smUpEh  :
      begin
        AddIndex('px', Column.Field.FieldName, [ixDescending]);
        Column.Title.SortMarker:= smDownEh;
      end;
      smDownEh:
      begin
        AddIndex('px', Column.Field.FieldName, [ixPrimary]);
        Column.Title.SortMarker:= smUpEh;
      end;
    end;
    IndexName:= 'px';
  end;
end;

procedure TSingleDataSet_f.dsMainStateChange(Sender: TObject);
begin
  inherited;
  if  NeedSave then 
  with (Sender as TDataSource).DataSet as Tcds do
  if F_IsBatchOperating<>True then              //只有批处理=false 的时候，才执行按钮刷新。
  begin
    SetToolbarButtonStatus((State  in [dsEdit,dsInsert])=False) ;
  end;
  SetButtonStatus;    //数据集的状态发生更改时，重新设置右边竖工具条的状态。20141116添加
end;

procedure TSingleDataSet_f.FormCreate(Sender: TObject);
begin
  inherited;   
  if IsLog    then
  begin
    SetLength(Data_Info,1);
    Data_Info[0]:=TDataInfo.Create();
    with Data_Info[0] do
    begin
      L_DataSetName:=cdsMain;
      L_Rkey:='rkey';     //默认为 rkey,可以修改
      L_TableName:= cdsMain.F_TableName;
      L_IsWrite:=True;
    end;
    PCName:=getpcName;
    N_SeeLog.Visible:=True;
  end;

  SetLength(ResetColumnsGrid,1);
  ResetColumnsGrid[0]:=DghMain.Name;
  RightsSetDataSetReadOnly ;
  ActiveGridEH:=DghMain;
  ResetGridColumns(Self,dm.ADOConnection1,UserRKEY,StrToInt(vprev)=2);
  cxPageControl2.ActivePageIndex:=0;
end;

procedure TSingleDataSet_f.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i:Integer ;
begin
  inherited;
  i:=0;
  if (Key = vk_return)and(cxPageControl2.ActivePageIndex=1) then
  begin
    if self.ActiveControl=LastControl then
      begin
        actAddExecute(nil);
      end
    else
      begin
        SelectNext(ActiveControl, True, True);
        while i<1 do
        begin
          if self.ActiveControl is TDBEdit    then
          begin
            with self.ActiveControl as  TDBEdit do
            begin
              if ReadOnly then
                SelectNext(ActiveControl, True, True)
              else
                i:=1;
            end;
          end
          else
          if self.ActiveControl is TDBButtonEdit    then
          begin
            with self.ActiveControl as  TDBButtonEdit do
            begin
              if ReadOnly then
                SelectNext(ActiveControl, True, True)
              else
                i:=1;
            end;
          end
          else
            i:=1;
        end;
      end;
  end;
end;

procedure TSingleDataSet_f.DghMainKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end;

  if (ssAlt in Shift)  and  (Key=86) then       //Alt+V
  with   (Sender as TDBGridEh).DataSource do
  begin
    if   DataSet is TADOQuery then
      showmessage((DataSet as  TADOQuery).SQL.Text)
    else
    if  DataSet is TADODataSet then
       showmessage((DataSet as  TADODataSet).CommandText)
    else
    if  DataSet is TClientDataSet then
       showmessage((DataSet as  TClientDataSet).CommandText)      ;
  end;
end;

procedure TSingleDataSet_f.actAddExecute(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if Active then
  begin
    Append ;
  end;
end;

procedure TSingleDataSet_f.actEditExecute(Sender: TObject);
begin
  inherited;
  cdsMain.Edit;
end;

procedure TSingleDataSet_f.actCancelExecute(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if Active then
  begin
    Cancel;
    CancelUpdates;

    dsMainStateChange(dsMain);
  end;
end;

procedure TSingleDataSet_f.cdsMainBeforeClose(DataSet: TDataSet);
var
  i:Integer;
begin
  inherited;
  with   (DataSet as TClientDataSet) do
  if  IndexName<>'' then
  DeleteIndex(IndexName) ;               //清除已存在的索引

  with   DghMain    do
  for i:=0 to Columns.Count-1  do      //清除表格中的排序状态
  begin
    if  Columns[i].Title.SortMarker<> smNoneEh   then
    Columns[i].Title.SortMarker:= smNoneEh;
  end;
end;

procedure TSingleDataSet_f.cdsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  with  DataSet as Tcds do
  begin
    if F_AutoNumb then
    begin
      FieldByName(F_AutoNumbField).Value:=DM.cds0004.FieldByName('SEED_VALUE').Value;
    end;
  end;

  if cxPageControl2.ActivePageIndex=1 then
  begin
    if  FirstControl<>nil then
    FirstControl.SetFocus;
  end
  else
    ColNotReadOnlyFocus(Self,DataSet);
end;

procedure TSingleDataSet_f.cdsMainAfterCancel(DataSet: TDataSet);
begin
  inherited;
  cdsMain.F_IsCancel:=False;
end;

procedure TSingleDataSet_f.cdsMainBeforeCancel(DataSet: TDataSet);
begin
  inherited;
  cdsMain.F_IsCancel:=True;
end;

procedure TSingleDataSet_f.N1Click(Sender: TObject);
begin
  inherited;
  show_ColsDisplaySet_frm (Self,ActiveGridEH,UserRKEY) ;
end;

procedure TSingleDataSet_f.N_SeeLogClick(Sender: TObject);
begin
  inherited;
  Log_See(cdsMain.F_TableName,cdsMain.fieldByName('rkey').AsInteger);

end;

procedure TSingleDataSet_f.FormDestroy(Sender: TObject);
var
  i:Integer;
begin
  inherited;
  for i:=0 to High(Data_Info) do
  Data_Info[i].Free;

end;

procedure TSingleDataSet_f.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  s:integer;
begin
  inherited;
  if (cdsMain.Active)and(NeedSave) then
  if (cdsMain.ChangeCount>0)or(cdsMain.State in [dsInsert,dsEdit]) then
  begin
    s:=messagebox(Self.Handle,'数据还没有保存，你要保存吗？','询问',MB_yesnocancel+MB_iconquestion)  ;
    if s=idyes then
      begin
        SaveData() ;
        CanClose:=True;
      end
    else
    if s=idCancel then
    begin
      begin
        CanClose:=False;
        Exit;
      end
    end
    else
    if s=idNo then
    begin
      cdsMain.Cancel;
      cdsMain.CancelUpdates;
      cdsMain.Close;
      CanClose:=True;
    end;   
  end;
  if DghMain.SumList.Active then
  DghMain.SumList.Active:=False;
  
end;

procedure TSingleDataSet_f.N3Click(Sender: TObject);
begin
  inherited;
  SetFrozenField(Self,ActiveGridEH,ActiveGridEH.SelectedField.FieldName,UserRKEY);
end;

procedure TSingleDataSet_f.N4Click(Sender: TObject);
begin
  inherited;
  CancelFrozenField(Self,ActiveGridEH,UserRKEY);
end;

procedure TSingleDataSet_f.FormShow(Sender: TObject);
begin
  inherited;
  with DM.cds0004  do
  begin
    if Active=False then
    begin
      CommandText:='select * from data0004 where Table_Name='+QuotedStr(cdsMain.F_TableName)  ;
      Open;

      if FieldByName('SEED_FLAG').AsInteger=4 then
      begin
        cdsMain.F_AutoNumb:=True;

        DghMain.FieldColumns[cdsMain.F_AutoNumbField].ReadOnly:=True;
        if  AutoNumb_Edit<>nil then
        begin
          AutoNumb_Edit.ReadOnly:=True;
          AutoNumb_Edit.Color:=clInactiveCaptionText;
        end;
      end;
    end;
  end;
end;

end.
