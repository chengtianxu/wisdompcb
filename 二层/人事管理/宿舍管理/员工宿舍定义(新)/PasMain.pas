unit PasMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,common,ADODB,MyClass, ExtCtrls, ComCtrls, Grids, DBGridEh, Menus,
  ImgList, StdCtrls, Buttons;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    tvDormitory: TTreeView;
    pcMain: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbDormitory: TDBGridEh;
    Panel3: TPanel;
    Panel4: TPanel;
    dbRoom: TDBGridEh;
    dbBed: TDBGridEh;
    PopupMenu1: TPopupMenu;
    DAdd: TMenuItem;
    DEdit: TMenuItem;
    DCheck: TMenuItem;
    DDelete: TMenuItem;
    PopupMenu2: TPopupMenu;
    RAdd: TMenuItem;
    REdit: TMenuItem;
    RCheck: TMenuItem;
    RDelete: TMenuItem;
    PopupMenu3: TPopupMenu;
    BAdd: TMenuItem;
    BEdit: TMenuItem;
    BCheck: TMenuItem;
    BDelete: TMenuItem;
    ImageList1: TImageList;
    Panel5: TPanel;
    btnExit: TBitBtn;
    btnExport: TBitBtn;
    Label1: TLabel;
    edtFilter: TEdit;
    Panel6: TPanel;
    lbHelp: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tvDormitoryClick(Sender: TObject);
    procedure DAddClick(Sender: TObject);
    procedure DEditClick(Sender: TObject);
    procedure DCheckClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DDeleteClick(Sender: TObject);
    procedure RAddClick(Sender: TObject);
    procedure REditClick(Sender: TObject);
    procedure RCheckClick(Sender: TObject);
    procedure RDeleteClick(Sender: TObject);
    procedure BAddClick(Sender: TObject);
    procedure BEditClick(Sender: TObject);
    procedure BCheckClick(Sender: TObject);
    procedure BDeleteClick(Sender: TObject);
    procedure edtFilterChange(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure PopupMenu3Popup(Sender: TObject);
    procedure dbRoomKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lbHelpClick(Sender: TObject);
    procedure lbHelpMouseEnter(Sender: TObject);
  private
    MC:TMyDataClass;
    roomsql:string;
    procedure CreatTree(tv:TTreeView);
    procedure CreatNode(cNode:TTreeNode;adoconn:TADOConnection);
    procedure OpenDataSet(ds:TADODataSet);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses DAMO, PasDModify, PasBModify, PasRModify;

{$R *.dfm}

procedure TfrmMain.CreatTree(tv: TTreeView);
var
  tNode:array of TTreeNode;
  NodeKey:^Integer;
  sqlstr:string;
  i:Integer;
begin
  tvDormitory.Items.Clear;
  sqlstr:='select dormitorymsg.rkey,dormitorymsg.D_name,b.hapeople,a.totle '+#13+
          '  from dormitorymsg left join  ' +#13+
          '  (select dormitorymsg.rkey,count(bedmsg.rkey) as totle '+#13+
          '  from dormitorymsg left join bedroommsg on dormitorymsg.rkey=bedroommsg.dormitoryid  ' +#13+
          '  left join bedmsg on bedroommsg.rkey=bedmsg.bedroomid '+#13+
          '  group by dormitorymsg.rkey,dormitorymsg.D_name) as a on dormitorymsg.rkey=a.rkey  '+#13+
          '  inner join  '+#13+
          '  (select dormitorymsg.rkey,count(bedmsg.rkey) as hapeople ' +#13+
          '  from dormitorymsg left join bedroommsg on dormitorymsg.rkey=bedroommsg.dormitoryid '+#13+
          '  left join bedmsg on bedroommsg.rkey=bedmsg.bedroomid and bedmsg.employeeid is not null '+#13+
          '  group by dormitorymsg.rkey,dormitorymsg.D_name) as b on dormitorymsg.rkey=b.rkey'+#13+
          '  order by dormitorymsg.rkey';

  if OpenQuery(dm.adotmp,sqlstr) then
  begin
    if not DM.adotmp.IsEmpty then
    begin
      i:=0;
      SetLength(tNode,DM.adotmp.RecordCount);
      tvDormitory.Items.Clear;
      DM.adotmp.First;
      while not dm.adotmp.Eof do
      begin
        New(NodeKey);
        NodeKey^:=DM.adotmp.FieldByName('rkey').AsInteger;
        tNode[i]:= tvDormitory.Items.AddChildObject(nil,
                  DM.adotmp.FieldByName('D_name').AsString+'('+DM.adotmp.FieldByName('hapeople').AsString +
                  '/'+DM.adotmp.FieldByName('totle').AsString+')',NodeKey);
        tNode[i].ImageIndex:=0;
        Self.CreatNode(tNode[i],DM.ADOConnection1);
        i:=i+1;
        DM.adotmp.Next;
      end;
    end;
  end;
end;

procedure TfrmMain.CreatNode(cNode: TTreeNode;adoconn:TADOConnection);
var
  aqtmp:TADOQuery;
  ChildNode:TTreeNode;
  ChildKey:^Integer;
  sqlstr:string;
begin
  try
    aqtmp:=TADOQuery.Create(Self);
    aqtmp.Connection:=adoconn;

    sqlstr:='select distinct bedroommsg.dormitoryid,bedroommsg.floor,isnull(b.hspeople,0) as hspeople,a.total from bedroommsg inner join '+#13+
            '(select dormitoryid,floor,count(*) as total from bedroommsg inner join bedmsg on bedroommsg.rkey=bedmsg.bedroomid '+#13+
            'group by dormitoryid,floor) as a on bedroommsg.dormitoryid=a.dormitoryid and bedroommsg.floor=a.floor'+#13+
            'left join '+#13+
            '(select dormitoryid,floor,count(*) as hspeople from bedroommsg inner join bedmsg on bedroommsg.rkey=bedmsg.bedroomid '+#13+
            'where bedmsg.employeeid is not null'+#13+
            'group by dormitoryid,floor) as b on bedroommsg.dormitoryid=b.dormitoryid and bedroommsg.floor=b.floor'+#13+
            'where bedroommsg.dormitoryid='+ IntToStr(Integer(cNode.Data^));

    if OpenQuery(aqtmp,sqlstr) then
    begin
      if not aqtmp.IsEmpty then
      begin
        aqtmp.First;
        while not aqtmp.Eof do
        begin
          New(ChildKey);
          ChildKey^:= aqtmp.FieldByName('floor').asinteger;
  //        ChildNode:=tvDormitory.Items.AddChildObject(cNode,'第'+aqtmp.FieldByName('floor').AsString+'层('+
  //                            aqtmp.FieldByName('hspeople').AsString+'/'+aqtmp.FieldByName('total').AsString+')',ChildKey);
          ChildNode:=tvDormitory.Items.AddChildObject(cNode,'第'+aqtmp.FieldByName('floor').AsString+'层('+
                              aqtmp.FieldByName('hspeople').AsString+'/'+aqtmp.FieldByName('total').AsString+')',ChildKey);
          ChildNode.ImageIndex:=0;
          aqtmp.Next;
        end;
      end;
    end;
  finally
    aqtmp.Free;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
 if not App_Init_2(DM.ADOConnection1) then
  begin
    ShowMsg('程序起动失败,请联系管理员',1);
    application.Terminate;
    exit;
  end;
  frmMain.Caption := application.Title;

//  vprev:='2';

  MC:=TMyDataClass.Create(DM.ADOConnection1);
  CreatTree(tvDormitory);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  roomsql:=DM.adoRoom.CommandText;
  if tvDormitory.Items.Count > 0 then
  begin
    tvDormitory.Items[0].Selected:=True;
    tvDormitoryClick(nil);
  end;
end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
  MC.Free;
end;

procedure TfrmMain.tvDormitoryClick(Sender: TObject);
begin
  if tvDormitory.Selected.Level=0 then
  begin
    OpenDataSet(DM.adoDormitory);
    DM.adoDormitory.Locate('rkey',Integer(tvDormitory.Selected.Data^),[]);
    with DM.adoRoom do
    begin
      Close;
      CommandText:=roomsql;
      Parameters.ParamByName('dormitoryid').Value:= Integer(tvDormitory.Selected.Data^);
      Open;
    end;
    DM.adoBed.Open;
//    pcMain.ActivePageIndex:=0;
  end
  else
  begin
    OpenDataSet(DM.adoDormitory);
    DM.adoDormitory.Locate('rkey',Integer(tvDormitory.Selected.Parent.Data^),[]);
    with DM.adoRoom do
    begin
      Close;
      CommandText:=roomsql + ' and bedroommsg.floor='+ IntToStr(Integer(tvDormitory.Selected.Data^));
      Parameters.ParamByName('dormitoryid').Value:= Integer(tvDormitory.Selected.Parent.Data^);
      Open;
    end;
    DM.adoBed.Open;
    pcMain.ActivePageIndex:=1;
  end;
end;

procedure TfrmMain.DAddClick(Sender: TObject);
begin
  try
    frmDModify:=TfrmDModify.Create(Application);
    frmDModify.status:=1;
    if frmDModify.ShowModal=mryes then
    begin
      OpenDataSet(DM.adoDormitory);
      CreatTree(tvDormitory);
    end;
  finally
    frmDModify.Free;
  end;
end;

procedure TfrmMain.DEditClick(Sender: TObject);
begin
  if DM.adoDormitoryrkey.Value=0 then exit;
  try
    frmDModify:=TfrmDModify.Create(Application);
    frmDModify.status:=2;
    if frmDModify.ShowModal=mryes then
    begin
      OpenDataSet(DM.adoDormitory);
      CreatTree(tvDormitory);
    end;
  finally
    frmDModify.Free;
  end;
end;

procedure TfrmMain.DCheckClick(Sender: TObject);
begin
  if DM.adoDormitoryrkey.Value=0 then exit;
  try
    frmDModify:=TfrmDModify.Create(Application);
    frmDModify.status:=3;
    frmDModify.ShowModal;
  finally
    frmDModify.Free;
  end;
end;

procedure TfrmMain.DDeleteClick(Sender: TObject);
var
  strsql:string;
begin
  if DM.adoDormitoryrkey.Value=0 then Exit;
  if MessageDlg('你确定要删除这条记录吗？',mtWarning,[mbYes,mbNo],0)=mryes then
  begin
    strsql:='delete from dormitorymsg where rkey='+ DM.adoDormitoryrkey.AsString;
    MC.ExecSql(strsql);
    OpenDataSet(DM.adoDormitory);
    CreatTree(tvDormitory);
  end;
end;

procedure TfrmMain.OpenDataSet(ds: TADODataSet);
begin
  ds.Close;
  ds.Open;
end;

procedure TfrmMain.RAddClick(Sender: TObject);
begin
  try
    frmRModify:=TfrmRModify.Create(Application);
    frmRModify.status:=1;
//    if tvDormitory.Selected.Level=0 then
//    begin
//      frmRModify.edtDormitory.Text:=Copy(tvDormitory.Selected.Text,0,Pos('(',tvDormitory.Selected.Text)-1);
//      frmRModify.edtDormitory.Tag:=Integer(tvDormitory.Selected.Data^);
//    end
//    else
//    begin
//      frmRModify.edtDormitory.Text:=Copy(tvDormitory.Selected.Parent.Text,0,Pos('(',tvDormitory.Selected.Parent.Text)-1);
//      frmRModify.edtDormitory.Tag:=Integer(tvDormitory.Selected.Parent.Data^);
//    end;
    if frmRModify.ShowModal=mryes then
    begin
      OpenDataSet(DM.adoRoom);
      OpenDataSet(DM.adoRoom);
      DM.adoRoom.Locate('rkey',frmRModify.rkey,[]);
      CreatTree(tvDormitory);
    end;
  finally
    frmRModify.Free;
  end;
end;

procedure TfrmMain.REditClick(Sender: TObject);
var
  rkey:Integer;
begin
  if DM.adoRoomrkey.Value=0 then exit;
  try
    rkey:= DM.adoRoomrkey.Value;
    frmRModify:=TfrmRModify.Create(Application);
    frmRModify.status:=2;
    if frmRModify.ShowModal=mryes then
    begin
      OpenDataSet(DM.adoRoom);
      DM.adoRoom.Locate('rkey',rkey,[]);
    end;
  finally
    frmRModify.Free;
  end;
end;

procedure TfrmMain.RCheckClick(Sender: TObject);
begin
  if DM.adoRoomrkey.Value=0 then exit;
  frmRModify:=TfrmRModify.Create(Application);
  frmRModify.status:=3;
  frmRModify.ShowModal;
end;

procedure TfrmMain.RDeleteClick(Sender: TObject);
var
  strsql:string;
begin
  if DM.adoRoomrkey.Value=0 then exit;
  if MessageDlg('你确定要删除这条房间记录吗',mtWarning,[mbYes,mbNo],0)=mryes then
  begin
    strsql:='select rkey,employeeid from bedmsg where bedroomid='+ DM.adoRoomrkey.AsString;
    MC.OpenQuery(DM.adotmp,strsql);
    if not DM.adotmp.IsEmpty then
    begin
      DM.adotmp.First;
      while not DM.adotmp.Eof do
      begin
        if DM.adotmp.FieldByName('employeeid').AsString<>'' then
        begin
          ShowMessage('此房间还有人住，不能删除');
          Exit;
        end;
        DM.adotmp.Next;
      end;
    end;
    strsql:='delete from bedmsg where bedroomid='+ DM.adoRoomrkey.AsString+ #13+
            'delete from bedroommsg where rkey='+ DM.adoRoomrkey.AsString;
    MC.ExecSql(strsql);
    OpenDataSet(DM.adoRoom);
    CreatTree(tvDormitory);
  end;
end;

procedure TfrmMain.BAddClick(Sender: TObject);
begin
  try
    frmBModify:=TfrmBModify.Create(Application);
    frmBModify.status:=1;
    frmBModify.edtRoomNO.Text:=DM.adoRoomR_code.AsString;
    frmBModify.edtRoomNO.Tag:=DM.adoRoomrkey.AsInteger;
    frmBModify.edtRoomName.Text:=DM.adoRoomR_name.AsString;
    if frmBModify.ShowModal= mryes then
    begin
      OpenDataSet(DM.adoBed);
      OpenDataSet(DM.adoRoom);
      DM.adoBed.Locate('rkey',frmBModify.rkey,[]);
      DM.adoRoom.Locate('rkey',frmBModify.edtRoomNO.Tag,[]);
      CreatTree(tvDormitory);
    end;
  finally
    frmBModify.Free;
  end;
end;

procedure TfrmMain.BEditClick(Sender: TObject);
var
  rkey:Integer;
begin
  if DM.adoBedrkey.Value=0 then Exit;
  try
    rkey:=dm.adoBedrkey.Value;
    frmBModify:=TfrmBModify.Create(Application);
    frmBModify.status:=2;
    frmBModify.edtRoomNO.Text:=DM.adoRoomR_code.AsString;
    frmBModify.edtRoomNO.Tag:=DM.adoRoomrkey.AsInteger;
    frmBModify.edtRoomName.Text:=DM.adoRoomR_name.AsString;
    if frmBModify.ShowModal= mryes then
    begin
      OpenDataSet(DM.adoBed);
      DM.adoBed.Locate('rkey',rkey,[]);
    end;
  finally
    frmBModify.Free;
  end;
end;

procedure TfrmMain.BCheckClick(Sender: TObject);
begin
  if DM.adoBedrkey.Value=0 then Exit;
  try
    frmBModify:=TfrmBModify.Create(Application);
    frmBModify.status:=3;
    frmBModify.edtRoomNO.Text:=DM.adoRoomR_code.AsString;
    frmBModify.edtRoomNO.Tag:=DM.adoRoomrkey.AsInteger;
    frmBModify.edtRoomName.Text:=DM.adoRoomR_name.AsString;
    frmBModify.ShowModal;
  finally
    frmBModify.Free;
  end;
end;

procedure TfrmMain.BDeleteClick(Sender: TObject);
var
  strsql:string;
  roomkey:Integer;
begin
  if DM.adoBedrkey.Value=0 then Exit;
  if MessageDlg('你确定要删除这条床位记录吗？',mtWarning,[mbYes,mbNo],0)= mryes then
  begin
    roomkey:=DM.adoBedbedroomid.Value;
    strsql:='select rkey,employeeid from bedmsg where rkey='+ DM.adoBedrkey.AsString;
    MC.OpenQuery(DM.adotmp,strsql);
    if DM.adotmp.FieldByName('employeeid').AsString<>'' then
    begin
      ShowMessage('此床位有人住，不能删除');
      Exit;
    end;
    strsql:='delete from bedmsg where rkey='+ DM.adoBedrkey.AsString+ #13+
            'update bedroommsg set bedcount=bedcount-1 from bedroommsg where rkey='+
            DM.adoBedbedroomid.AsString;
    MC.ExecSql(strsql,True);
    OpenDataSet(DM.adoBed);
    OpenDataSet(DM.adoRoom);
    DM.adoRoom.Locate('rkey',roomkey,[]);
    CreatTree(tvDormitory);
  end;
end;

procedure TfrmMain.edtFilterChange(Sender: TObject);
begin
  if pcMain.ActivePageIndex=1 then
    if Trim(edtFilter.Text)<>'' then
    begin
      DM.adoRoom.Filtered:=False;
      DM.adoRoom.Filter:='r_name like ''%' + Trim(edtFilter.Text)+ '%''';
      DM.adoRoom.Filtered:=True;
    end
    else
      DM.adoDormitory.Filter:='';
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.btnExportClick(Sender: TObject);
begin
  common.Export_dbGridEH_to_Excel(dbRoom,Application.Title);
end;

procedure TfrmMain.PopupMenu1Popup(Sender: TObject);
begin
  DAdd.Enabled:=(vprev='2') or (vprev='4');
  DEdit.Enabled:= (vprev='2') or (vprev='4');
  DDelete.Enabled:= ((vprev='2') or (vprev='4')) and (DM.adoRoom.IsEmpty=True);
end;

procedure TfrmMain.PopupMenu2Popup(Sender: TObject);
begin
  RAdd.Enabled:=(vprev='2') or (vprev='4');
  REdit.Enabled:= (vprev='2') or (vprev='4');
  RDelete.Enabled:= ((vprev='2') or (vprev='4')) and (DM.adoBed.IsEmpty=True);
end;

procedure TfrmMain.PopupMenu3Popup(Sender: TObject);
begin
  BAdd.Enabled:=(vprev='2') or (vprev='4');
  BEdit.Enabled:= (vprev='2') or (vprev='4');
  BDelete.Enabled:= ((vprev='2') or (vprev='4'));
end;

procedure TfrmMain.dbRoomKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Char(Key)='V') and (ssalt in Shift) then
    ShowMessage(DM.adoRoom.CommandText);
end;

procedure TfrmMain.lbHelpClick(Sender: TObject);
begin
  ShowMessage('1、各菜单只有权限2与4可以新增、编辑和删除；'+#13+
              '2、删除功能只有在其内不包含房间或床位的情况下才可见。');
end;

procedure TfrmMain.lbHelpMouseEnter(Sender: TObject);
begin
  lbHelp.Cursor:= crHandPoint;
end;

end.
