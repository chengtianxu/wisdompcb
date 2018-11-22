unit form_SetField;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, Grids, DBGridEh, DB, ADODB, DBClient,StrUtils,
  Provider, StdCtrls;
type
  TNoPermissionSeeFieldInfo=class
  private
  protected
  public
    L_GridName               :TDBGridEh;     //添加下拉列表将创建在哪个表格名上
    L_NoPermissionFields     :array of string;// 不允许查看的字段
  end;


type
  Tfrm_SetField = class(TForm)
    DataSource1: TDataSource;
    DBGridEh1: TDBGridEh;
    tlb1: TToolBar;
    btPost: TSpeedButton;
    btCancel: TSpeedButton;
    btPrior: TSpeedButton;
    btNext: TSpeedButton;
    btClose: TSpeedButton;
    dtRead: TADODataSet;
    dspRead: TDataSetProvider;
    cdsRead: TClientDataSet;
    bt_Reset: TSpeedButton;
    procedure btPostClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure DataSource1StateChange(Sender: TObject);
    procedure btCancelClick(Sender: TObject);
    procedure btPriorClick(Sender: TObject);
    procedure btNextClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cds0849_1FieldOrderChange(Sender: TField);
    procedure cds0849_1FilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure bt_ResetClick(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
  private
    OperatingGrid: TDBGridEh;
    procedure cds849_1AfterScroll(DataSet: TDataSet);
    procedure SetStatus ;
    Function NoPermissionSee(vprev_bool:Boolean;CheckField:string;GridName:string):Boolean;
    { Private declarations }
  public
    
    { Public declarations }
  end;
                                       // 
procedure SetGridColumns(SetForm:TForm;cdsD849:TClientDataSet;AConn:TADOConnection;SeeRight:Boolean);// StdCall;     //  cds0849:TClientDataSet;
Function ResetColumns(SelfForm:TForm;cdsD849:TClientDataSet;Grid:TDBGridEh;D073_ptr:Integer):Boolean;//StdCall;

var
  frm_SetField: Tfrm_SetField;
  NoPermissionSeeField_Info: array of TNoPermissionSeeFieldInfo;
  Operat_bool:Boolean;
  Int_data0419_Rkey:Integer;

implementation

uses common;

{$R *.dfm}

Function Tfrm_SetField.NoPermissionSee(vprev_bool:Boolean;CheckField:string;GridName:string):Boolean;
var
  i,j:Integer;
begin      //  如果vprev_bool是真，如果CheckField在 NoPermissionSeeField_Info信息中找到，返回为falst,没找到为真
  NoPermissionSee:= True  ;
  if (vprev_bool)and ( NoPermissionSeeField_Info   <>nil) then
  begin
    for i:=0 to High(NoPermissionSeeField_Info) do
    begin
      if UpperCase(NoPermissionSeeField_Info[i].L_GridName.Name)=UpperCase(GridName) then
      begin
        for j:=0 to High(NoPermissionSeeField_Info[i]. L_NoPermissionFields)do
        begin
          if UpperCase(CheckField) =UpperCase(NoPermissionSeeField_Info[i].L_NoPermissionFields[j]) then
          begin
            NoPermissionSee:= False;
           // ShowMessage('0');
            Exit;
          end;
        end;
        Exit;
      end;  
    end;
  end;
end;
                                       // 
procedure SetGridColumns(SetForm:TForm;cdsD849:TClientDataSet;AConn:TADOConnection;SeeRight:Boolean);
var
  GridCount,i,ColID:Integer;
  StrFilter:string;
begin
  Operat_bool:=SeeRight;
  with frm_SetField.dtRead do
  begin
    Connection:=AConn;
    Close;
    CommandText:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    Int_data0419_Rkey:=FieldByName('rkey').AsInteger;
  end ;
  for GridCount:=0 to SetForm.ComponentCount-1 do
  if  SetForm.Components[GridCount] is TDBGridEh then
  with (SetForm.Components[GridCount] as TDBGridEh) do
  begin
//    ShowMessage((Self.Components[GridCount] as TDBGridEh).Name);
    if cdsD849.Active=False then
    begin
      cdsD849.Params.ParamByName('vPrograme').Value:=Extractfilename(application.exename);
      cdsD849.Params.ParamByName('vD073_ptr').Value:=StrToInt(rkey73);
      cdsD849.Open;
    end;

//    cds0849:=TClientDataSet.Create(frm_SetField);
//    cds0849:=cdsD849;
    cdsD849.Filtered:=False ;                         //用窗口名和表格名对数据进行过滤
    StrFilter:='FormName='+QuotedStr(SetForm.Name)
              +' and GridName=' +QuotedStr((SetForm.Components[GridCount] as TDBGridEh).Name);
    cdsD849.Filter:= StrFilter;
    cdsD849.Filtered:=True;

    cdsD849.Last;
    while not cdsD849.Bof do     // 遍历cds0849 ，查找是否有表格中不存的列，不存在删除。
    begin
     // ShowMessage(DM.cds0849.FieldByName('FieldName').AsString);
      for i:=0 to Columns.Count-1  do
      begin
        if UpperCase(Trim(Columns[i].FieldName))=UpperCase(Trim(cdsD849.FieldByName('FieldName').AsString))then
          begin
            Break  ;
          end
        else                                         //如果没有找到
          begin
            if i=Columns.Count-1 then   //已经是最后一列
            begin
              //ShowMessage('Delete:'+DM.cds0849.FieldByName('FieldName').AsString);
              cdsD849.Delete   ;
            end;
          end;
      end;
      cdsD849.Prior;
    end;
   // DM.cds0849.ApplyUpdates(0);

    for i:=0 to Columns.Count-1  do            //如果表格中的列在 DM.cds0849中不存在，添加
    if Columns[i].FieldName<>''then
    begin
      cdsD849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
      cdsD849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Columns[i].FieldName);
      cdsD849.Filtered:=True;
      if  cdsD849.IsEmpty then               //如果在data0849表记录中不存在，添加
      begin
        cdsD849.Append;
        cdsD849.FieldByName('D419_ptr')    .Value:=Int_data0419_Rkey;
        cdsD849.FieldByName('D073_ptr')    .Value:=StrToInt(rkey73);
        cdsD849.FieldByName('FormName')    .Value:=SetForm.Name;
        cdsD849.FieldByName('GridName')    .Value:=Name;
        cdsD849.FieldByName('FieldName')   .Value:=Columns[i].Field.FieldName;
        cdsD849.FieldByName('FieldCaption').Value:=Columns[i].Field.DisplayLabel;
        cdsD849.FieldByName('FieldOrder')  .Value:=i;
        cdsD849.FieldByName('FieldWidth')  .Value:=Columns[i].Width;
        //ShowMessage('insert:'+Columns[i].Field.FieldName+' '+Columns[i].Field.DisplayLabel);
        if Columns[i].Visible then
          cdsD849.FieldByName('IsDisplay').Value:=True
        else
          cdsD849.FieldByName('IsDisplay').Value:=False;
        cdsD849.Post;
      end;
    end;

    ColID:=0;
    cdsD849.Filtered:=False ;
    cdsD849.Filter:= StrFilter;
    cdsD849.Filtered:=True;
    while not cdsD849.Eof do   //根据 cds0849表中的记录，重新定义表格
    begin
      for i:=0 to Columns.Count-1 do
      if UpperCase(Columns[i].FieldName)=UpperCase(cdsD849.FieldByName('FieldName').AsString)then
      begin
        begin
          Columns[i].Width:= cdsD849.FieldByName('FieldWidth').AsInteger;
          if cdsD849.FieldByName('IsDisplay').AsBoolean then
            Columns[i].Visible:=frm_SetField.NoPermissionSee(SeeRight,Columns[i].FieldName,cdsD849.FieldByName('GridName').AsString)
          else
            Columns[i].Visible:=False;
          Columns[i].Index:=ColID; //DM.cds0849.FieldByName('FieldOrder').AsInteger;
          ColID:=ColID+1;
          {   //如果使用下面的方法，会造成不显示的列排在最后。在字段设置窗口的列错位
          Columns[i].Width:= DM.cds0849.FieldByName('FieldWidth').AsInteger;   
          if DM.cds0849.FieldByName('IsDisplay').AsBoolean then
            begin
            Columns[i].Visible:=True ;
            Columns[i].Index:=ColID; //DM.cds0849.FieldByName('FieldOrder').AsInteger;
            ColID:=ColID+1;
            end
          else
            Columns[i].Visible:=False;   }
        end;
        Break;
      end;
      cdsD849.Next;
    end;
  end;
  cdsD849.Filtered:=False;
end;
                                                          // cds0849:TClientDataSet;
Function ResetColumns(SelfForm:TForm;cdsD849:TClientDataSet;Grid:TDBGridEh;D073_ptr:Integer):Boolean;
var
  vOwnerName:string;
  i:Integer;
  StrFilter:string;
begin
  Result:=False;
  
  if Int_data0419_Rkey=0 then
  begin
    ShowMessage('该程序在Data0419表上没有找到相关记录！！！');
    Exit;
  end;
  try
    frm_SetField:=Tfrm_SetField.Create(SelfForm);
    frm_SetField.Font.Size    := SelfForm.Font.Size;
    frm_SetField.Font.Charset := SelfForm.Font.Charset;
    frm_SetField.Font.Name    := SelfForm.Font.Name;

    with  frm_SetField do
    begin
      DataSource1.DataSet:= cdsD849;
      cdsD849.FieldByName('FieldOrder').OnChange:= cds0849_1FieldOrderChange;
      cdsD849.FieldByName('FieldWidth').OnChange:= cds0849_1FieldOrderChange;
      cdsD849.FieldByName('IsDisplay') .OnChange:= cds0849_1FieldOrderChange;
      cdsD849                       .AfterScroll:= cds849_1AfterScroll  ;
      vOwnerName:=SelfForm.Name;
      OperatingGrid:= Grid;
      with Grid do
      begin
        //如果将主窗体的表格列顺序或列宽度调整过，窗口显示时，重新获取最新列宽数据。
        cdsD849.Filtered:=False ;                         //用窗口名和表格名对数据进行过滤
        StrFilter:='FormName='+QuotedStr(SelfForm.Name)
                  +' and GridName=' +QuotedStr(Grid.Name);
        cdsD849.Filter:= StrFilter;
        //ShowMessage(cds0849.Filter);
        cdsD849.Filtered:=True;

        for i:=0 to Columns.Count-1  do
        begin
          cdsD849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
          cdsD849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Columns[i].Field.FieldName);
          cdsD849.Filtered:=True;
          if  cdsD849.IsEmpty then               //如果在data0849表记录中不存在，添加
          begin
            cdsD849.Append;
            cdsD849.FieldByName('D419_ptr')    .Value:=Int_data0419_Rkey;
            cdsD849.FieldByName('D073_ptr')    .Value:=D073_ptr;
            cdsD849.FieldByName('FormName')    .Value:=vOwnerName;
            cdsD849.FieldByName('GridName')    .Value:=Grid.Name;
            cdsD849.FieldByName('FieldName')   .Value:=Grid.Columns[i].Field.FieldName;
            cdsD849.FieldByName('FieldCaption').Value:=Grid.Columns[i].Field.DisplayLabel;
            cdsD849.FieldByName('FieldOrder')  .Value:=i;
            cdsD849.FieldByName('FieldWidth')  .Value:=Grid.Columns[i].Width;
            if Grid.Columns[i].Visible then
              cdsD849.FieldByName('IsDisplay').Value:=True
            else
              cdsD849.FieldByName('IsDisplay').Value:=False;
            cdsD849.Post;
          end
          else                             //如果在data0849表记录中存在
          begin
            if ((cdsD849.FieldByName('FieldOrder').Value<>i)       // 如果列顺序或宽度有改变, 修改
                 or(cdsD849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width))and(cdsD849.FieldByName('IsDisplay').AsBoolean)then   //如果列顺序或宽度有改变,且这个字段是显示，修改
            begin
              cdsD849.Edit;
              if (cdsD849.FieldByName('FieldOrder').Value<>i)and(cdsD849.FieldByName('IsDisplay').AsBoolean) then
                cdsD849.FieldByName('FieldOrder').Value:=i ;
              if cdsD849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width then
              begin
                cdsD849.FieldByName('FieldWidth').Value:=Grid.Columns[i].Width ;
              end;
              cdsD849.Post;
            end;
          end;
        end;

//        for i:=0 to Grid.Columns.Count-1 do      //遍历表格列，
//        begin
//          cds0849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
//          cds0849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Grid.Columns[i].Field.FieldName);
//       //   ShowMessage(cds0849.Filter);
//          cds0849.Filtered:=True;
//
//          if  cds0849.IsEmpty=False then
//          begin
//            if ((cds0849.FieldByName('FieldOrder').Value<>i)
//                 or(cds0849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width))and(cds0849.FieldByName('IsDisplay').AsBoolean)then   //如果列顺序或宽度有改变,且这个字段是显示，修改
//            begin
//              cds0849.Edit;
//              if (cds0849.FieldByName('FieldOrder').Value<>i)and(cds0849.FieldByName('IsDisplay').AsBoolean) then
//                cds0849.FieldByName('FieldOrder').Value:=i ;
//              if cds0849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width then
//              begin
//                cds0849.FieldByName('FieldWidth').Value:=Grid.Columns[i].Width ;
//              end;
//              cds0849.Post;
//            end;
//          end;
//        end;
      end;
      cdsD849.Filtered:=False;
      cdsD849.Filter:= StrFilter;
      cdsD849.Filtered:=True;
      if ShowModal=mrOk then
      begin
        Result:=True;
      end;
    end ;
  finally
    frm_SetField.Free;
  end;
end;

procedure Tfrm_SetField.SetStatus ;
begin
  with DataSource1.DataSet as TClientDataSet do
  if  (State in[dsEdit,dsInsert])or(ChangeCount>0) then
    begin
      btPost  .Enabled:=True;
      btCancel.Enabled:=True;
      btNext.Enabled:=False;
      btPrior.Enabled:=False;
      btClose.Enabled:=False;
      bt_Reset.Enabled:=False;
    end
  else
    begin
      btPost  .Enabled:=False;
      btCancel.Enabled:=False;
      btNext.Enabled:=True;
      btPrior.Enabled:=True;
      btClose.Enabled:=True;
      bt_Reset.Enabled:=True;
    end;
end;

procedure Tfrm_SetField.btPostClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  begin
    if State in[dsEdit ,dsInsert] then
    Post;
    ApplyUpdates(0);
  end;
  SetStatus;
end;

procedure Tfrm_SetField.btCloseClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_SetField.DataSource1StateChange(Sender: TObject);
begin
  SetStatus;
end;

procedure Tfrm_SetField.btCancelClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  if Active then
  begin
    Cancel;
    CancelUpdates;
    SetStatus;
  end;
end;

procedure Tfrm_SetField.btPriorClick(Sender: TObject);
begin
  with DBGridEh1.DataSource.DataSet do
  if Active then
  begin
    Prior;
  end
end;

procedure Tfrm_SetField.btNextClick(Sender: TObject);
begin
  with DBGridEh1.DataSource.DataSet do
  if Active then
  begin
    Next;
  end
end;

procedure Tfrm_SetField.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  s:integer;  
begin
  with DBGridEh1.DataSource.DataSet as TClientDataSet do
  if Active and (state in [dsInsert,dsEdit])or (changeCount>0)then
  begin
    S:= messagedlg('表格设置已经更改,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0);
    if S = mryes  then
      begin
        if (state in [dsInsert,dsEdit]) then
        Post ;
        ApplyUpdates(0)  ;
      end
    else
    if S = mrcancel then
      abort;
  end ;
end;

procedure Tfrm_SetField.cds0849_1FieldOrderChange(Sender: TField);
var
  i:Integer;
begin
  if Self.Showing then
  with DataSource1.DataSet do
  begin
    if UpperCase(Sender.FieldName )=UpperCase('FieldOrder') then
    begin
      for i:=0 to OperatingGrid.Columns.Count-1 do
      begin
        if UpperCase(FieldByName('FieldName').AsString)
              = UpperCase(OperatingGrid.Columns[i].Field.FieldName)  then
        begin
          OperatingGrid.Columns[i].Index:=Sender.AsInteger;
          Break;
        end;
      end;
    end
    else
    if UpperCase(Sender.FieldName )=UpperCase('FieldWidth') then
    begin
      for i:=0 to OperatingGrid.Columns.Count-1 do
      begin
        if UpperCase(FieldByName('FieldName').AsString)
              = UpperCase(OperatingGrid.Columns[i].Field.FieldName)  then
        begin
          OperatingGrid.Columns[i].Width:=Sender.AsInteger;
          Break;
        end;
      end;
    end
    else
    if UpperCase(Sender.FieldName )=UpperCase('IsDisplay') then
    begin
      for i:=0 to OperatingGrid.Columns.Count-1 do
      begin
        if UpperCase(FieldByName('FieldName').AsString)
              = UpperCase(OperatingGrid.Columns[i].Field.FieldName)  then
        begin
          OperatingGrid.Columns[i].Visible:=Sender.AsBoolean;
          Break;
        end;
      end;
    end  ;
  end;
end;

procedure Tfrm_SetField.cds0849_1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
//  Accept:=AnsiContainsText(UpperCase(DataSet.FieldByName('FieldName').AsString),UpperCase(FilterValue)) ;
end;

procedure Tfrm_SetField.bt_ResetClick(Sender: TObject);
begin
  with DataSource1.DataSet as TClientDataSet do
  if Active then
  begin
    if State in [dsEdit,dsInsert] then Cancel;
    if UpdateStatus in[usInserted,usModified]then CancelUpdates;
    while not Eof do
    if IsEmpty =False then
    Delete;
    SetStatus;
  end
end;

procedure Tfrm_SetField.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key in[VK_INSERT,VK_delete] then   //  , VK_down
  begin
    Key:=0;
  end
  else
  with   (Sender as TDBGridEh ).DataSource.DataSet  do
  if (Key in[VK_down])and(RecNo=RecordCount ) then    //如果击向下键，且当前记录号等于总记录数
  begin
    Key:=0;
  end;
end;

procedure Tfrm_SetField.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  with  DataSource1.DataSet  do
  begin
    if NoPermissionSee(Operat_bool,FieldByName('FieldName').AsString  , OperatingGrid .Name)=False then
    AFont.Color:=  clMedGray;   //  clRed
  end;
end;

procedure Tfrm_SetField.cds849_1AfterScroll(DataSet: TDataSet);
begin
  with  DataSource1.DataSet  do
  DBGridEh1.readonly:=NoPermissionSee(Operat_bool,FieldByName('FieldName').AsString  , OperatingGrid .Name)=False;
end;

end.
