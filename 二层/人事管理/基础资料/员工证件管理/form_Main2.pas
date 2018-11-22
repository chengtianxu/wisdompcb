unit form_Main2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls,
  ExtCtrls,Pick_Item_Single,ConstVar,common,
  DB, ADODB, DBCtrlsEh, Grids, DBGridEh, DBClient;
type
  TDropDownInfo=class
  private
  protected
  public
    L_GridName:       TDBGridEh;         //添加下拉列表将创建在哪个表格名上
    L_ListDataSetName:TDataSet;    //下拉列表数据集名
    L_DropdownColumn:string;             //添加下拉列表的表格列名
    L_ListDataSetFilterField:string;     // 下拉列表数据集过滤字段名，
    L_GetValueField :string;             //获取值的字段名
    L_ListResultField :string;           //下拉列表数据集返回的字段名     AnsiString
    L_FormWidth:Integer;                 //下拉窗体的宽度
    L_FormHeight:Integer;                //下拉窗体的高度
    L_FormType:Integer;                  //下拉窗体的类型 1:单选窗口，2：多选窗口
  end;
type
  Tfrm_Main2 = class(TForm)
    tlb1: TToolBar;
    btInsert: TSpeedButton;
    btEdit: TSpeedButton;
    btPost: TSpeedButton;
    btCancel: TSpeedButton;
    btDelete: TSpeedButton;
    btFilter: TSpeedButton;
    btRefresh: TSpeedButton;
    btOut: TSpeedButton;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btUpload: TSpeedButton;
    btDownload: TSpeedButton;
    SpeedButton1: TSpeedButton;
    btPrint: TSpeedButton;
    btClose: TSpeedButton;
    DBGridEh1: TDBGridEh;
    StatusBar1: TStatusBar;
    DataSource1: TDataSource;
    procedure btInsertClick(Sender: TObject);
    procedure btPostClick(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btDeleteClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure btRefreshClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edt_chinesenameKeyPress(Sender: TObject; var Key: Char);
    procedure DataSource1StateChange(Sender: TObject);
    procedure DBGridEh1KeyPress(Sender: TObject; var Key: Char);
  private
    DropDown_Info:array of TDropDownInfo;
    procedure DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);
    Function PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
    procedure DghReadOnlyFocus(Sender :TDBGridEh);
  procedure ColNotReadOnlyFocus(F:TForm;Ds:TDataSet);
  procedure KeyPressDBGridEH(Sender: TDBGridEh; var Key: Char;F:TForm) ;
    { Private declarations }
  public
    procedure ColumnAddPickList(ADBGridEH:TDBGridEH;ColumnName:string;ADataSet:TDataSet;AFieldName:string); overload;
    procedure ColumnAddPickList(ADBGridEH:TDBGridEH;ColumnName:string;AList:array of string); overload;
    function SaveCheck():Boolean;
  end;

var
  frm_Main2: Tfrm_Main2;

implementation

uses dmo, Main, SelectItemUnit;

{$R *.dfm}

procedure Tfrm_Main2.ColumnAddPickList(ADBGridEH:TDBGridEH;ColumnName:string;AList:array of string);
var
  i:Integer;
begin
  if  High(AList )>0 then
  begin
    ADBGridEH.FieldColumns[ColumnName].AutoDropDown:=True;  //列表框自动下拉
    for i:=0 to High(AList ) do
    begin
      ADBGridEH.FieldColumns[ColumnName].PickList.Add( AList[i]);
    end;
  end;
end;

procedure Tfrm_Main2.ColumnAddPickList(ADBGridEH:TDBGridEH;ColumnName:string;ADataSet:TDataSet;AFieldName:string);
begin
  with  ADataSet  do
  begin
    if Active=False then
    Open;   //打开要添加的记录，

    if   RecordCount>0 then
    begin
      ADBGridEH.FieldColumns[ColumnName].AutoDropDown:=True;  //列表框自动下拉
//      ADBGridEH.FieldColumns[ColumnName].ButtonStyle:=cbsDropDown;
//      ADBGridEH.FieldColumns[ColumnName].AlwaysShowEditButton:=true;
      while not  Eof do
      begin
        ADBGridEH.FieldColumns[ColumnName].PickList.Add( FieldByName(AFieldName).AsString);
        Next;
      end;
    end;
  end;
end;

procedure Tfrm_Main2.DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);  //
var
//  frmSelect: TfrmSelect;
  i:Integer;
  L,T,W,X,H:Integer;
  Vpoint:   Tpoint;
begin
  with ((Sender as TControl).Parent).Parent as TDBGridEh do
  begin     //   ShowMessage(DataSource.DataSet.Name );
    if  DataSource.DataSet is TClientDataSet then
    if ((((Sender as TControl).Parent).Parent as TDBGridEh).DataSource.DataSet as TClientDataSet).ReadOnly then
    Exit;
    if  DataSource.DataSet is TCustomADODataSet then
    if (DataSource.DataSet as TCustomADODataSet).LockType=ltReadOnly then
    Exit;
    if ReadOnly then        //如果当前表格控件是只读，退出。
    Exit;
//    if SelectedField.ReadOnly then    //如果当前表格选择的字段是只读
//    Exit;
  end;
 // ((Sender as TControl).Parent as TColumnEh).


  with ((Sender as TControl).Parent).Parent as TDBGridEh do  //Button的父是EDIT，EDIT的父才是DBGRIDEH控件
  begin
    try
      begin
        for i:=0 to High( DropDown_Info) do
        begin
          if UpperCase(DropDown_Info[i].L_DropdownColumn)=UpperCase(SelectedField.FieldName)  then
          with DropDown_Info[i] do
          begin
             Vpoint   := (Sender as TControl).Parent.ClientToScreen(Point((Sender as TControl).Left,(Sender as TControl).Top));
             t:= Vpoint.y+(Sender as TControl).Height;
             if L_FormWidth  =0 then
               w:=400
             else
               w:=L_FormWidth;
             if L_FormHeight  =0 then
               H:=240
             else
               H:=L_FormHeight;
             x:=Screen.Width- Vpoint.X-w- (Sender as TControl).Parent.Width;
             if x<0 then
               L:=Screen.Width -w- (Sender as TControl).Parent.Width
             else
               L:= Vpoint.X- (Sender as TControl).Parent.Width;
               //屏幕的高度-控件按钮所在的高度  小于弹出窗口的高度
             if  (Screen.Height-t)<   h then t:=Screen.Height-h;

            if L_ListDataSetName.Active=False then
            L_ListDataSetName.Open;                  //
            //DataSource.DataSet.FieldByName(L_DropdownColumn).OnChange(DataSource.DataSet.FieldByName(L_DropdownColumn))
            //ShowMessage(IntToStr(w));
            if L_FormType<=1 then
            begin
              if ShowAddListForm(Self.Handle,L_ListDataSetName,L_ListDataSetFilterField,
                        Trim(L_GridName.FieldColumns[L_DropdownColumn].Field.asstring),
                        L,T,w) then   //
              begin
                if not (L_GridName.DataSource.DataSet.State in [dsEdit,dsInsert]) then
                  L_GridName.DataSource.DataSet.Edit;
                L_GridName.DataSource.DataSet.FieldByName(L_GetValueField).Value :=
                              L_ListDataSetName.FieldByName(L_ListResultField).value;
                if L_GridName.DataSource.DataSet.Filtered then
                L_GridName.DataSource.DataSet.Filtered :=False;
              end  ;
//            end
//            else
//            if L_FormType=2 then
//            begin
//              if ShowfrmSelectMultiItem(Self.Handle,L_ListDataSetName,'',
//                        L,T,L_FormWidth) then   //
//              begin
//                if  L_ListDataSetName.FieldByName('selected').AsBoolean then
//                begin
//                  if L_GridName.DataSource.DataSet.State <> dsInsert then
//                    L_GridName.DataSource.DataSet.Insert;
//                  L_GridName.DataSource.DataSet.FieldByName(L_GetValueField).Value :=
//                                L_ListDataSetName.FieldByName(L_ListResultField).value;
//                  L_ListDataSetName.FieldByName('selected').AsBoolean:=False;
//                  L_ListDataSetName.Next;
//                end;
////                if not (L_GridName.DataSource.DataSet.State in [dsEdit,dsInsert]) then
////                  L_GridName.DataSource.DataSet.Edit;
////                L_GridName.DataSource.DataSet.FieldByName(L_GetValueField).Value :=
////                              L_ListDataSetName.FieldByName(L_ListResultField).value;
//                if L_GridName.DataSource.DataSet.Filtered then
//                L_GridName.DataSource.DataSet.Filtered :=False;
//              end  ;
            end;
          end;
        end;
      end;
    finally
    //  frmSelect.Free;
    end;
  end;
end;

Function Tfrm_Main2.PrimKeyExists(AQ:TADOQuery;Sql:string):boolean;
//var
//  myqu:TADOquery;
begin
  try
    Result:=False;
    AQ.Close;
    AQ.SQL.Clear;
    AQ.SQL.Add(sql);
    AQ.Open; //功能：通过执行SQL语句（可以是多表复杂查找），查找相关表中是否存在相关记录，即存在查找。如果找到返回真值，否则返回假值。
//用法：if PrimKeyExists('select * from GongYingShang where 供应商编号='+ quotedstr(trim(ADODateSet1.FieldByName('供应商编号').AsString )))=false then showmessage('不存在');
    if AQ.IsEmpty=False then
    Result:=true ;
  finally
   // myqu.Free;
  end;
end;

procedure Tfrm_Main2.btInsertClick(Sender: TObject);
begin
  with DM.cdsHrcertificate1 do
  if Active then
  Append;
end;

function Tfrm_Main2.SaveCheck():Boolean;
var
  strMsg,strSQL:string;    
  I_Row:Integer;
begin
  Result:=False;
  strMsg:='';

  with DM.cdsHrcertificate1 do
  begin
    if State in [dsEdit ,dsInsert] then
    Post;
//    if IsEmpty then
//      strMsg:=strMsg+'明细表至少要有一行记录！！！'+#13
//    else
    begin
      try
        DisableControls ;
        First;
        for I_Row:=0 to RecordCount-1 do
        begin
          if FieldByName('employeeid') .IsNull then
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('chinesename').DisplayLabel +'：的值不能为空！！！'+#13;
          if FieldByName('code') .IsNull then
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('code').DisplayLabel +'：的值不能为空！！！'+#13;
          if FieldByName('datadetail_ptr').IsNull  then
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('item').DisplayLabel +'：的值不能为空！！！'+#13;
          if (FieldByName('type').IsNull) then
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('type').DisplayLabel +'：的值不能为空！！！'+#13;
          if FieldByName('startdate').IsNull then
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('startdate').DisplayLabel +'：的值不能为空！！！'+#13;
//          if (FieldByName('enddate').IsNull)then
//          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('enddate'). DisplayLabel+'：的值不能为空！！！'+#13;
          if (FieldByName('status').IsNull)then
          strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('status'). DisplayLabel+'：的值不能为空！！！'+#13;

          if (UpdateStatus=usInserted)and(FieldByName('employeeid').AsString<>'')and(FieldByName('datadetail_ptr').AsString<>'') then
          begin
            strSQL:='select * from dbo.Hrcertificate where employeeid='+FieldByName('employeeid').AsString
               +' and datadetail_ptr='+FieldByName('datadetail_ptr').AsString;
            //ShowMessage(strSQL)   ;
            if PrimKeyExists(DM.ADOQuery1,strSQL)   then
            strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，'+FieldByName('chinesename').DisplayLabel+'：'+FieldByName('chinesename').AsString +'；'
                          +FieldByName('item').DisplayLabel+'：'+FieldByName('item').AsString
                          +'，该记录已经存在！！！'+#13;
          end;
          Next;  
        end;
      finally
        EnableControls;
      end;

    end;
  end;

//  with  DM.cdsHrcertificate_1 do
//  begin
//    if FieldByName('employeeid') .IsNull then
//    strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('chinesename').DisplayLabel +'：的值不能为空！！！'+#13;
//    if FieldByName('code') .IsNull then
//    strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('code').DisplayLabel +'：的值不能为空！！！'+#13;
//    if FieldByName('datadetail_ptr').IsNull  then
//    strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('item').DisplayLabel +'：的值不能为空！！！'+#13;
//    if (FieldByName('type').IsNull) then
//    strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('type').DisplayLabel +'：的值不能为空！！！'+#13;
//    if FieldByName('startdate').IsNull then
//    strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('startdate').DisplayLabel +'：的值不能为空！！！'+#13;
//    if (FieldByName('enddate').IsNull)then
//    strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('enddate'). DisplayLabel+'：的值不能为空！！！'+#13;
//    if (FieldByName('status').IsNull)then
//    strMsg:=strMsg+'第'+IntToStr(I_Row+1)+'行，字段：'+FieldByName('status'). DisplayLabel+'：的值不能为空！！！'+#13;
//
//    if (UpdateStatus=usInserted)and(edt_chinesename.Text<>'')and(DBComboBox1.Text<>'') then
//    begin
//      strSQL:='select * from dbo.Hrcertificate where employeeid='+FieldByName('employeeid').AsString
//         +' and datadetail_ptr='+FieldByName('datadetail_ptr').AsString;
//      //ShowMessage(strSQL)   ;
//      if PrimKeyExists(DM.ADOQuery1,strSQL)   then
//      strMsg:=strMsg+#13+FieldByName('chinesename').DisplayLabel+'：'+FieldByName('chinesename').AsString
//                    +#13+FieldByName('item').DisplayLabel+'：'+FieldByName('item').AsString
//                    +#13+'该记录已经存在！！！';
//    end;
//  end;

  if strMsg<>'' then
  begin
    strMsg:=Copy(strMsg,0,Length(strMsg)-1);
    ShowMessage(strMsg);
    Result:=True;
  end;
end;

procedure Tfrm_Main2.btPostClick(Sender: TObject);
begin
  with DM.cdsHrcertificate1 do
  begin
    if  State in [dsEdit,dsInsert ]  then
    Post;
    if SaveCheck=False then
    begin
      if changeCount >0 then
      ApplyUpdates(0);
    end
    else
    Abort;
  end;
  DataSource1StateChange(DataSource1);
end;

procedure Tfrm_Main2.btCancelClick(Sender: TObject);
begin
  with DM.cdsHrcertificate1 do
  if Active=True then
  begin
    Cancel;
    CancelUpdates;
  end;
  DataSource1StateChange(DataSource1);
end;

procedure Tfrm_Main2.btDeleteClick(Sender: TObject);
var
  i:integer;
begin
  with DM.cdsHrcertificate1 do
  if Active and (not IsEmpty) then
  with DBGridEh1 do
  begin
    if SelectedRows.Count >1 then  //如果用户选择的行数大于1，即多行。
      begin
        try
          with   DataSource.DataSet   do
          for i:= SelectedRows.Count -1 downto 0 do
          begin
          GotoBookmark(pointer(SelectedRows.Items[i]));
          Delete;        //删除多行。
          end;
        finally
        end;
      end
    else
     DataSource.DataSet.Delete; //否则用户选择的是单行，删除。
  end ;

  DataSource1StateChange(DataSource1);
end;

procedure Tfrm_Main2.btPriorClick(Sender: TObject);
begin
  with DM.cdsHrcertificate1 do
  if Active then
  Prior;
end;

procedure Tfrm_Main2.btNextClick(Sender: TObject);
begin
  with DM.cdsHrcertificate1 do
  if Active then
  Next;
end;

procedure Tfrm_Main2.btRefreshClick(Sender: TObject);
var
  i_employeeid,i_datadetail_ptr :Integer;
  D_inputdate:TDateTime;
begin
  i_employeeid     := DM.cdsHrcertificate1.fieldByName('employeeid').Value;
  i_datadetail_ptr := DM.cdsHrcertificate1.fieldByName('datadetail_ptr').Value;
  D_inputdate      := DM.cdsHrcertificate1.fieldByName('inputdate').Value;
  DM.cdsHrcertificate1.Refresh;
  DM.cdsHrcertificate1.Locate('employeeid;datadetail_ptr;inputdate',VarArrayOf([i_employeeid,i_datadetail_ptr,D_inputdate]),[]) ;
//  with DM.cdsHrcertificate do
//  if Active then
//  begin
//    bm:= DM.cdsHrcertificate.GetBookmark;
//    try
//      DM.cdsHrcertificate.Close;
//      DM.cdsHrcertificate.Open;
//
//      DM.cdsHrcertificate.GotoBookmark(bm);
//    finally
//      DM.cdsHrcertificate.FreeBookmark(bm);
//    end;
//  end
end;

procedure Tfrm_Main2.FormClose(Sender: TObject; var Action: TCloseAction);
var
  s:integer;
begin
  with DM.cdsHrcertificate1 do
  if Active then
  if  (State in [dsInsert,dsEdit])or (ChangeCount>0 )then
  begin
     S:= messagedlg('数据还没有保存,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0);
     if S = mryes  then
       begin
         if  (State in [dsInsert,dsEdit]) then
         Post  ;
         if SaveCheck then
         Abort;
         ApplyUpdates(0);
       end
     else
     if S = mrcancel then
         abort
     else
     if s=mrNo then
       begin
         Cancel    ;
         CancelUpdates;
       end;
  end;

end;

procedure Tfrm_Main2.BitBtn3Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
//  frmPick_Item_Single:=TfrmPick_Item_Single.Create(Application);
//  try
//    InputVar.Fields := 'employeecode/员工编号/200,chinesename/员工姓名/200';
//    InputVar.Sqlstr :='select rkey,chinesename,employeecode from employeemsg';
//    InputVar.AdoConn := DM.ADOConn;
//    frmPick_Item_Single.InitForm_New(InputVar);
//    if frmPick_Item_Single.ShowModal=mrok then
//    begin
//      //Edit1.Tag :=  frmPick_Item_Single.adsPick.FieldValues['RKEY'];
//      if Not(DM.cdsHrcertificate.State in [dsEdit,dsInsert]) then
//        DM.cdsHrcertificate.Edit;
//      edt_chinesename.Field.Value:= frmPick_Item_Single.adsPick.FieldValues['chinesename'];
//      DBEdit2.SetFocus;
//    end;
//  finally
//    frmPick_Item_Single.adsPick.Close;
//    frmPick_Item_Single.Free ;
//  end;
end;

procedure Tfrm_Main2.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  SetLength(DropDown_Info,1);
  DropDown_Info[0]:=TDropDownInfo.Create();
  with DropDown_Info[0] do
  begin
    L_GridName              :=DBGridEh1;
    L_ListDataSetName       :=DM.dt_v_employeemsg;
    L_DropdownColumn        :='employeecode';   //审批流程代码
    L_ListDataSetFilterField:='employeecode';
    L_ListResultField       :='employeecode';
    L_GetValueField         :='employeecode';
  end;

  for i:=0 to High(DropDown_Info) do
  begin
    with (DropDown_Info[i].L_GridName) do
    begin
      FieldColumns[DropDown_Info[i].L_DropdownColumn].ButtonStyle:=cbsDropDown;
      FieldColumns[DropDown_Info[i].L_DropdownColumn].AlwaysShowEditButton:=true;
      FieldColumns[DropDown_Info[i].L_DropdownColumn].OnEditButtonClick:= DBGridEHColumnsButtonClick;
    end;
  end;

  ColumnAddPickList(DBGridEh1,'chinesename',DM.dt_v_employeemsg,'chinesename');
  if DM.dt_dictid.Active=False then
    DM.dt_dictid.Active:=True;
  ColumnAddPickList(DBGridEh1,'item',DM.dt_dictid,'item');
 // ColumnAddPickList(DBGridEh1,'type',['个人','公司']);
  ColumnAddPickList(DBGridEh1,'type1',['个人','公司']);
 // ColumnAddPickList(DBGridEh1,'status',['有效','无效']);
  ColumnAddPickList(DBGridEh1,'stts',['有效','无效']);
//  DropDown_Info[1]:=TDropDownInfo.Create();
//  with DropDown_Info[1] do
//  begin
//    L_GridName              :=DghMain;
//    L_ListDataSetName       :=cds0034;
//    L_DropdownColumn        :='DEPT_CODE';
//    L_ListDataSetFilterField:='DEPT_CODE';
//    L_ListResultField       :='DEPT_CODE';
//    L_GetValueField         :='DEPT_CODE';
//  end;
//  Frm_Main.DataSetAddToCombobox(DM.dt_dictid,DBComboBox1,'item');

  DBGridEh1.DataSource.DataSet.Open;
end;

procedure Tfrm_Main2.edt_chinesenameKeyPress(Sender: TObject; var Key: Char);
var
  i:Integer;
begin
//  if key=#13 then
//  begin
//    if Sender is TWinControl  then
//    if (Sender as TWinControl )  =mem_remark then
//    begin
//      btPost.Click;
//      btInsert.Click;
//      edt_chinesename.SetFocus;
//      Exit;
//    end;
//
//    if  Sender is TDBComboBox then
//    begin
//      with (Sender as TDBComboBox) do
//      if  Field.Required then
//      if  Trim(Text)='' then
//      begin
//        (Sender as TDBComboBox).DroppedDown := true;
//        Key:=Char( 0);
//        Exit;
//      end;
//    end
//    else
//    if  Sender is TDBEdit then
//    begin
//      with (Sender as TDBEdit) do
//      if  Field.Required then
//      begin
//        if (Sender as TDBEdit )=edt_chinesename then
//        BitBtn3.Click;
//      if  Trim(Text)='' then
//        Exit;
//      end
//    end;
//    for   i:=0 to Self.ControlCount-1 do
//    begin
//      if  Controls[i] is TWinControl then
//      if (Controls[i] as TWinControl).TabOrder= (Sender as TWinControl).TabOrder+1 then
//      (Controls[i] as TWinControl).SetFocus;
//     // if  Controls[i].tab
//    end;
//
//   // postmessage(self.handle,wm_keydown,vk_tab,0);
//  end
end;

procedure Tfrm_Main2.DataSource1StateChange(Sender: TObject);
begin
//  if Assigned(frm_Main2) then
//  with frm_Main2 do
  begin
    if  (dm.cdsHrcertificate1.State in[dsEdit,dsInsert])or(DM.cdsHrcertificate1.ChangeCount>0) then
    begin
      btInsert.Enabled:=False;
      btEdit.Enabled:=False;
      btPost.Enabled:=True;
      btCancel.Enabled:=True;
      btRefresh.Enabled:=False;
      btNext.Enabled:=False;
      btPrior.Enabled:=False;
    end
    else
    begin
      btInsert.Enabled:=True;
      btEdit.Enabled:=True;
      btPost.Enabled:=False;
      btCancel.Enabled:=False;
      btRefresh.Enabled:=True;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
    end;
  end;
end;

procedure Tfrm_Main2.DBGridEh1KeyPress(Sender: TObject; var Key: Char);
begin
  KeyPressDBGridEH(Sender as TDBGridEh, key,self);
end;

procedure Tfrm_Main2.KeyPressDBGridEH(Sender: TDBGridEH; var Key: Char;F:TForm);
var
i:integer;
begin
  if Key = #13 then
  if f.ActiveControl = Sender then
  begin
    if TDBGridEH(f.ActiveControl).SelectedIndex= TDBGridEH(f.ActiveControl).FieldCount-1 then  //如果选择是最后一行。
    begin
      DghReadOnlyFocus(Sender as TDBGridEh);
      //TDBGridEH(f.ActiveControl).SelectedIndex:=0 ;      //光标就跳回第一列。
      Key := #0;
    end
    else
    begin
      for i:=TDBGridEH(f.ActiveControl).SelectedIndex+1 to TDBGridEH(f.ActiveControl).FieldCount-1 do //
      begin
        if (TDBGridEH(f.ActiveControl).Columns[i].ReadOnly=false) and (TDBGridEH(f.ActiveControl).Columns[i].Visible=true) then
          begin
            TDBGridEH(f.ActiveControl).SelectedIndex :=i; //TDBGridEH(f.ActiveControl).SelectedIndex+1
            Key := #0;
            exit;
          end
        else
        if I=TDBGridEH(f.ActiveControl).FieldCount-1  then
          begin
            DghReadOnlyFocus(Sender as TDBGridEh);
             //TDBGridEH(f.ActiveControl).SelectedIndex:=0 ;      //光标就跳回第一列。
            Key := #0;
          end;
      end;
    end;
  end;
end;

procedure Tfrm_Main2.ColNotReadOnlyFocus(F:TForm;Ds:TDataSet);
var
  i:Integer;
begin
  for i:=0 to F.ComponentCount-1 do
  begin
    if (F.Components[i] is TDBGridEh) then
    if (F.Components[i] as TDBGridEh).DataSource.DataSet=Ds then
    begin
      DghReadOnlyFocus(F.Components[i] as TDBGridEh);
      Exit;
    end;
  end;
end;

procedure Tfrm_Main2.DghReadOnlyFocus(Sender :TDBGridEh);
var
  i:Integer;
begin
  for i:=0 to   (Sender as TDBGridEh).FieldCount-1   do
  begin
    if ((Sender as TDBGridEh).Columns[i].ReadOnly=false)and ((Sender as TDBGridEh).Columns[i].Visible=True ) then   //如果该字段的只读为假
    begin
      (Sender as TDBGridEh).SelectedIndex:=i;            //该字段获得焦点。
      Exit;
    end;
  end;
end;

end.
