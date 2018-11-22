unit form_SetField;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ToolWin, ComCtrls, Grids, DBGridEh, DB, ADODB, DBClient,StrUtils,
  Provider, StdCtrls;

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
  private
    OperatingGrid: TDBGridEh;
//    FilterValue:string;
//    vD073_ptr:Integer;
    vOwnerName:string;
//    Reading:Boolean;
    procedure SetStatus ;
    { Private declarations }
  public

    { Public declarations }
  end;
procedure SetGridColumns(selfForm:TForm;cds0849,cdsRead:TClientDataSet;D073_ptr:Integer);
Function ResetColumns(SelfForm:TForm;AConn:TADOConnection;cds0849:TClientDataSet;Grid:TDBGridEh;
              D073_ptr:Integer):Boolean;StdCall;

var
  frm_SetField: Tfrm_SetField;
  

implementation

uses damo;

//uses DM_f;

{$R *.dfm}

Function ResetColumns(SelfForm:TForm;AConn:TADOConnection;cds0849:TClientDataSet;Grid:TDBGridEh;
              D073_ptr:Integer):Boolean;
var
//  s:string;
  i:Integer;
  StrFilter:string;
begin
  Result:=False;
  try
    frm_SetField:=Tfrm_SetField.Create(SelfForm);
    frm_SetField.Font.Size    := SelfForm.Font.Size;
    frm_SetField.Font.Charset := SelfForm.Font.Charset;
    frm_SetField.Font.Name    := SelfForm.Font.Name;
    with  frm_SetField do
    begin
      vOwnerName:=SelfForm.Name;
      dtRead.Connection:=AConn;
      DataSource1.DataSet:= cds0849;
      cds0849.FieldByName('FieldOrder').OnChange:= cds0849_1FieldOrderChange;
      cds0849.FieldByName('FieldWidth').OnChange:= cds0849_1FieldOrderChange;
      cds0849.FieldByName('IsDisplay') .OnChange:= cds0849_1FieldOrderChange;
     { with ds0849 do
      begin
        CommandText:=' select data0849.* from data0849 join data0419 on data0849.[D419_ptr]=data0419.[rkey]'
          +' where data0419.programe='+QuotedStr(Extractfilename(application.exename))
          +' and data0849.[D073_ptr]='+IntToStr(D073_ptr)
          +' and data0849.[FormName]='+ QuotedStr(vOwnerName)
          +' and data0849.[GridName]='+ QuotedStr(Grid.Name)
          +' order by data0849 .[FieldOrder]';
        Open;
      end;  }
      with CDSRead do
      begin
        Close;
        CommandText:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
       // ShowMessage(CommandText);
        Open;

        if CDSRead.IsEmpty then
        begin
          ShowMessage('程序没有找到注册信息，在Data0419表上！！！');
          Exit;
        end;
      end;
      OperatingGrid:= Grid;
      with Grid do
      begin  //如果将主窗体的表格调整过，窗口显示时，重新获取最新列宽数据。
        cds0849.Filtered:=False ;                         //用窗口名和表格名对数据进行过滤
        StrFilter:='FormName='+QuotedStr(SelfForm.Name)
                  +' and GridName=' +QuotedStr(Grid.Name);
        cds0849.Filter:= StrFilter;
        //ShowMessage(cds0849.Filter);
        cds0849.Filtered:=True;

        for i:=0 to Columns.Count-1  do            //如果表格中的列在 DM.cds0849中不存在，添加
        begin
          cds0849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
          cds0849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Columns[i].Field.FieldName);
          cds0849.Filtered:=True;
          if  cds0849.IsEmpty then               //如果在data0849表记录中不存在，添加
          begin
            cds0849.Append;
            cds0849.FieldByName('D419_ptr')    .Value:=CDSRead.FieldByName('rkey').AsInteger;
            cds0849.FieldByName('D073_ptr')    .Value:=D073_ptr;
            cds0849.FieldByName('FormName')    .Value:=vOwnerName;
            cds0849.FieldByName('GridName')    .Value:=Grid.Name;
            cds0849.FieldByName('FieldName')   .Value:=Grid.Columns[i].Field.FieldName;
            cds0849.FieldByName('FieldCaption').Value:=Grid.Columns[i].Field.DisplayLabel;
            cds0849.FieldByName('FieldOrder')  .Value:=i;
            cds0849.FieldByName('FieldWidth')  .Value:=Grid.Columns[i].Width;
            if Grid.Columns[i].Visible then
              cds0849.FieldByName('IsDisplay').Value:=True
            else
              cds0849.FieldByName('IsDisplay').Value:=False;
            cds0849.Post;
          end
        end;

        for i:=0 to Grid.Columns.Count-1 do      //遍历表格列，
        begin
          cds0849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
          cds0849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Grid.Columns[i].Field.FieldName);
       //   ShowMessage(cds0849.Filter);
          cds0849.Filtered:=True;

          if  cds0849.IsEmpty=False then
          begin
            if ((cds0849.FieldByName('FieldOrder').Value<>i)
                 or(cds0849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width))and(cds0849.FieldByName('IsDisplay').AsBoolean)then   //如果列顺序或宽度有改变,且这个字段是显示，修改
            begin
              cds0849.Edit;
              if (cds0849.FieldByName('FieldOrder').Value<>i)and(cds0849.FieldByName('IsDisplay').AsBoolean) then
                cds0849.FieldByName('FieldOrder').Value:=i ;
              if cds0849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width then
              begin
                cds0849.FieldByName('FieldWidth').Value:=Grid.Columns[i].Width ;
              //  ShowMessage(Grid.Columns[i].Field.FieldName+':'+inttostr(Grid.Columns[i].Width));
              end;
//              ShowMessage(Grid.Columns[i].Field.DisplayLabel+#13+cds0849.FieldByName('FieldOrder').AsString+':'+inttostr(i)+#13
//              +cds0849.FieldByName('FieldWidth').AsString+':'+inttostr(Grid.Columns[i].Width));
              cds0849.Post;
            end;
          end;
//          if  cds0849.IsEmpty then               //如果在data0849表记录中不存在，添加
//          begin
//            cds0849.Append;
//            cds0849.FieldByName('D419_ptr')    .Value:=CDSRead.FieldByName('rkey').AsInteger;
//            cds0849.FieldByName('D073_ptr')    .Value:=D073_ptr;
//            cds0849.FieldByName('FormName')    .Value:=vOwnerName;
//            cds0849.FieldByName('GridName')    .Value:=Grid.Name;
//            cds0849.FieldByName('FieldName')   .Value:=Grid.Columns[i].Field.FieldName;
//            cds0849.FieldByName('FieldCaption').Value:=Grid.Columns[i].Field.DisplayLabel;
//            cds0849.FieldByName('FieldOrder')  .Value:=i;
//            cds0849.FieldByName('FieldWidth')  .Value:=Grid.Columns[i].Width;
//            if Grid.Columns[i].Visible then
//              cds0849.FieldByName('IsDisplay').Value:=True
//            else
//              cds0849.FieldByName('IsDisplay').Value:=False;
//            cds0849.Post;
//          end
//          else             //如果存在。
//          begin
//            if ((cds0849.FieldByName('FieldOrder').Value<>i)
//                 or(cds0849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width)
//               )then   //and(cds0849.FieldByName('IsDisplay').AsBoolean)如果列顺序或宽度有改变,且这个字段是显示，修改
//            begin
//              cds0849.Edit;
////              if cds0849.FieldByName('FieldOrder').Value<>i then
////                cds0849.FieldByName('FieldOrder').Value:=i ;
//              if cds0849.FieldByName('FieldWidth').Value<>Grid.Columns[i].Width then
//              begin
//                cds0849.FieldByName('FieldWidth').Value:=Grid.Columns[i].Width ;
//              ShowMessage(Grid.Columns[i].Field.FieldName+':'+inttostr(Grid.Columns[i].Width));
//              end;
//              cds0849.Post;
//            end;
//          end;
        end;
      end;
      cds0849.Filtered:=False;
      cds0849.Filter:= StrFilter;
     // ShowMessage(cds0849.Filter);
      cds0849.Filtered:=True;
//      Reading:=False;
      if ShowModal=mrOk then
      begin
        Result:=True;
      end;
    end ;
  finally
    frm_SetField.Free;
  end;
end;

procedure SetGridColumns(selfForm:TForm;cds0849,cdsRead:TClientDataSet;D073_ptr:Integer);
var
  GridCount,i,ColID,ExecRkey:Integer;//
  StrFilter:string;
begin
  with cdsRead do
  begin
    Close;
    CommandText:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    ExecRkey:=FieldByName('rkey').Value;
  end ;
  for GridCount:=0 to selfForm.ComponentCount-1 do
  if  selfForm.Components[GridCount] is TDBGridEh then
  with (selfForm.Components[GridCount] as TDBGridEh) do
  begin
//    ShowMessage((Self.Components[GridCount] as TDBGridEh).Name);
    if cds0849.Active=False then
    begin
      cds0849.Params.ParamByName('vPrograme').Value:=Extractfilename(application.exename);
      cds0849.Params.ParamByName('vD073_ptr').Value:=D073_ptr;
      cds0849.Open;
    end;
    cds0849.Filtered:=False ;                         //用窗口名和表格名对数据进行过滤
    StrFilter:='FormName='+QuotedStr(selfForm.Name)
              +' and GridName=' +QuotedStr((selfForm.Components[GridCount] as TDBGridEh).Name);
    cds0849.Filter:= StrFilter;
    cds0849.Filtered:=True;

    cds0849.First;
    while not cds0849.Eof do     // 遍历cds0849 ，查找是否有表格中不存的列，不存在删除。
    begin
      for i:=0 to Columns.Count-1  do
      begin
        if UpperCase(Trim(Columns[i].FieldName))=UpperCase(Trim(cds0849.FieldByName('FieldName').AsString))then
          begin
            Break  ;
          end
        else                                         //如果没有找到
          begin
            if i=Columns.Count-1 then   //已经是最后一列
            begin
             // ShowMessage('Delete:'+DM.cds0849.FieldByName('FieldName').AsString);
              cds0849.Delete   ;
            end;
          end;
      end;
      cds0849.Next;
    end;
    cds0849.ApplyUpdates(0);

    for i:=0 to Columns.Count-1  do            //如果表格中的列在 DM.cds0849中不存在，添加
    begin
      cds0849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
      cds0849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Columns[i].Field.FieldName);
      cds0849.Filtered:=True;
      if  cds0849.IsEmpty then               //如果在data0849表记录中不存在，添加
      begin
        cds0849.Append;
        cds0849.FieldByName('D419_ptr')    .Value:=ExecRkey;
        cds0849.FieldByName('D073_ptr')    .Value:=D073_ptr;
        cds0849.FieldByName('FormName')    .Value:=selfForm.Name;
        cds0849.FieldByName('GridName')    .Value:=Name;
        cds0849.FieldByName('FieldName')   .Value:=Columns[i].Field.FieldName;
        cds0849.FieldByName('FieldCaption').Value:=Columns[i].Field.DisplayLabel;
        cds0849.FieldByName('FieldOrder')  .Value:=i;
        cds0849.FieldByName('FieldWidth')  .Value:=Columns[i].Width;
      //  ShowMessage(Columns[i].Field.DisplayLabel+Columns[i].Field.FieldName+':'+IntToStr(i));
       // ShowMessage('insert:'+Columns[i].Field.FieldName+' '+Columns[i].Field.DisplayLabel);
        if Columns[i].Visible then
          cds0849.FieldByName('IsDisplay').Value:=True
        else
          cds0849.FieldByName('IsDisplay').Value:=False;
        cds0849.Post;
      end;
    end;

    ColID:=0;
    cds0849.Filtered:=False ;
    cds0849.Filter:= StrFilter;
    cds0849.Filtered:=True;
    while not cds0849.Eof do   //根据 cds0849表中的记录，重新定义表格
    begin
      for i:=0 to Columns.Count-1 do
      if UpperCase(Columns[i].FieldName)=UpperCase(cds0849.FieldByName('FieldName').AsString)then
      begin
        begin
          Columns[i].Width:= cds0849.FieldByName('FieldWidth').AsInteger;
          if cds0849.FieldByName('IsDisplay').AsBoolean then
            Columns[i].Visible:=True
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
      cds0849.Next;
    end;
  end;
  cds0849.Filtered:=False;
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
  with DataSource1.DataSet as TClientDataSet  do
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

end.
