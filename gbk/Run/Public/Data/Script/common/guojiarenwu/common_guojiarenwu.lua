-------------------------
--***********************
--��������
--v0.9
--ZesT
--***********************
-------------------------
MD_GUOJIARENWU_DATE								=	10
MD_GUOJIARENWU_ROUND							=	11
MD_GUOJIARENWU_CIRCLE							=	12
MD_GUOJIARENWU_UNACCEPT						=	13
MD_GUOJIARENWU_LASTABANDON				=	14

--MisDescBegin
--Const
x300303_g_ScriptId 					= 300303
x300303_g_MissionId					= 405
x300303_g_MissionName				= "��������"
x300303_g_MissionKind				= 23
x300303_g_MissionLevel 			= 10

x300303_g_Country						=	0

x300303_g_LevelLowerlimit	=	1			--�ȼ����ޣ������õȼ���
x300303_g_LevelUpperlimit	=	100		--�ȼ����ޣ������õȼ���
x300303_g_MaxRound				= 20
x300303_g_MaxCircle				= 10
--��������
x300303_g_ErrorMessage_Country	= "�㲻�Ǳ����ˣ�"--�Ի��������
x300303_g_ErrorMessage_Level		="������Ҫ�㣬���������㻹����ǿ��\n���㵽10���������Ұɡ�"
x300303_g_ErrorMessage_Abandon	="��ոշ����˸����񣬹���15�����������Ұ�"
x300303_g_ErrorMessage_Round		="........."
x300303_g_StringStart				="����ʼ��������"
x300303_g_StringEnd					="������ɵ�������"
x300303_g_StartNPC					="���ߵ��ϰ�"
x300303_g_Mission_Songxin					=	{ --�������ŵ�����Ҫͬʱ�ڸ�NPC�ϰ�������ű���ע����Ʒ�ż�����
																		{hash = 1, missionName = "����1", levelsection = 2, missionKind = "songxin", NPC_Name = "ҩ���ϰ�", NPC_ID = 115, item_ID = 13010077, item_Name = "����ҩ���ϰ����", CoordinatesX=125,CoordinatesY=230, scene_Name = "���º���", scene_ID = 11, symbol = "���Ĺ㳡������",
																			Start = "��������͵����º������Ĺ㳡�����Ǹ�����ҩ���ϰ�(125,230)����1_1", continue = "��ȥ��ҩ���ϰ�\n�������º������Ĺ㳡�����Ǹ���", endstr = "лл�㣡\n��ЩǮ�͵�ʱл���������Ҫ����", continueX = "Ŷ��XX���ţ��ܹ�֪������ƽ�����̫���ˡ������鷳���ȥת�������Ѿ��յ�����", endstrX = "лл�������������XXX"},
																		{hash = 2, missionName = "����2", levelsection = 3, missionKind = "songxin", NPC_Name = "���Ĵ���ʹ��", NPC_ID = 113, item_ID = 13010078, item_Name = "�������Ĵ���ʹ�ߵ���", CoordinatesX=134,CoordinatesY=229, scene_Name = "���º���", scene_ID = 11, symbol = "���Ĺ㳡������",
																		 	Start = "��������͵����º������Ĺ㳡�����Ǹ��������Ĵ���ʹ��(134,229)����1_2", continue = "��ȥ�����Ĵ���ʹ��\n�������º������Ĺ㳡�����Ǹ���", endstr = "лл�㣡\n��ЩǮ�͵�ʱл���������Ҫ����", continueX = "Ŷ��XX���ţ��ܹ�֪������ƽ�����̫���ˡ������鷳���ȥת�������Ѿ��յ�����", endstrX = "лл�������������XXX"},
																		{hash = 3, missionName = "����3", levelsection = 1, missionKind = "songxin", NPC_Name = "��������ʦ", NPC_ID = 114, item_ID = 13010079, item_Name = "������������ʦ����", CoordinatesX=134,CoordinatesY=239, scene_Name = "���º���", scene_ID = 11, symbol = "���Ĺ㳡������",
																			Start = "��������͵����º������Ĺ㳡�����Ǹ�������������ʦ(134,239)����1_3", continue = "��ȥ����������ʦ\n�������º������Ĺ㳡�����Ǹ���", endstr = "лл�㣡\n��ЩǮ�͵�ʱл���������Ҫ����", continueX = "Ŷ��XX���ţ��ܹ�֪������ƽ�����̫���ˡ������鷳���ȥת�������Ѿ��յ�����", endstrX = "лл�������������XXX"}
																		}
x300303_g_Mission_teshushaguai		=	{--δ��ɣ���
																		{hash = 4, missionName = "����ɱ��1", levelsection = 1, missionKind = "teshushaguai", moster_Name = "1234", monster_ID = 1234, CoordinatesX=125,CoordinatesY=230, scene_Name = "���º���", scene_ID = 11, symbol = "���Ĺ㳡������",
																			Start = "����xxx��xxxx��Ű�����ǰȥ����", continue = "", endstr = "лл��Ϊ�������������Ӧ�õ�"}
																		}
x300303_g_Mission_xunwu						=	{--ֱ�Ӱ���ʽ����������
																		{hash = 5, missionName = "Ѱ��1", levelsection = 1, missionKind = "xunwu", NPC_Name = "ҩ���ϰ�", item_ID = 11990002, item_Name = "���ּ����ط�", item_Num = 3,  CoordinatesX=125,CoordinatesY=230, scene_Name = "���º���", scene_ID = 11, symbol = "���Ĺ㳡������",
																			Start = "��Ҫ3�ݡ����ּ����ط�����\n�����º������Ĺ㳡�����Ǹ�����ҩ���ϰ�(125,230)��������򵽡�", continue = "��Ҫ�Ķ����أ�\n��ȥ���º������Ĺ㳡�����Ǹ�����ҩ���ϰ�(125,230)����ɣ���", endstr = "�����еĳ���- -||"}
																		}
x300303_g_Mission_gaojixunwu			=	{--ͬѰ��
																		{hash = 6, missionName = "�߼�Ѱ��1", levelsection = 5, missionKind = "gaojixunwu", item_ID = 12020001, item_Name = "����1����ҩ", item_Num = 24, profession = "����", skill = "�ƶ�",
																			Start = "���������࣬����ҪXX,XXְҵXX����Ӧ�ÿ���������������ҩ��ID�������Ժ��ٻ�������24ƿ����1����ҩ���棩", continue = "����������Ҫ��XXX��û�����������������ң�\nXXְҵXX����Ӧ�ÿ�����������", endstr = "������Щ����������������"},
																		{hash = 9, missionName = "�߼�Ѱ��2", levelsection = 4, missionKind = "gaojixunwu", item_ID = 12020002, item_Name = "����2����ҩ", item_Num = 10, profession = "����", skill = "�ƶ�",
																			Start = "���������࣬����ҪXX,XXְҵXX����Ӧ�ÿ���������������ҩ��ID�������Ժ��ٻ�������10ƿ����2����ҩ���棩", continue = "����������Ҫ��XXX��û�����������������ң�\nXXְҵXX����Ӧ�ÿ�����������", endstr = "������Щ����������������"}
																		}
x300303_g_Mission_dingdianshiyongwupin	=	{--ע��ͬʱע��ʹ�õ���Ʒ�������Ʒ�Ľű���
																					{hash = 7, missionName = "����ʹ����Ʒ1", levelsection = 1, missionKind = "dingdianshiyongwupin", item_Name = "�����̻�", item_ID = 13010076, item_Num = 1, CoordinatesX=105, CoordinatesY=257, CoordinatesR=10, scene_Name = "���º���", scene_ID = 11, symbol = "���Ĺ㳡�м�",
																						Start = "������һ��ʵ�顰����ʡ�������֡�����������������Ĺ㳡�򿪣���1_1", continue = "��ȥ��\nֻ�������Ĺ㳡�򿪣���ĵط�����Ҫ�Ż�", endstr = "���úã������ҵ��о����Ǻܳɹ��ã�������Ӧ�õ�"}
																					}
x300303_g_Mission_shoujishengzhangdian	=	{--�����㣬������ű���ע��ű��ţ�����������Ʒ��ע�ᣬ��server��ͼ���޸������㼰��������ƣ�û�п��Ƶ�Ҫ��ͬĿ¼��SCN�ļ���ע�ᣡ��
																					{hash = 8, missionName = "�ռ�������1", levelsection = 1, missionKind = "shoujishengzhangdian", item_ID = 13010080, item_Name = "������", item_Num = 10, CoordinatesX=125,CoordinatesY=230, scene_Name = "���º���", scene_ID = 11, symbol = "���Ĺ㳡������",
																						Start = "��������������\n����һ��Ҫ�ڿ�����࣬��������Ҫ��\n������ܰ���ȥ�㳡���ռ�10�������ޣ��һ���㽱����1_1", continue = "�����ռ�10�������ޣ��ڹ㳡��Ӧ�����ҵ�", endstr = "���úã������Ǹ���Ľ���"}
																					}
x300303_g_Mission									=	{
																		{hash = 1, missionName = "����1", levelsection = 2, missionKind = "songxin"},
																		{hash = 2, missionName = "����2", levelsection = 3, missionKind = "songxin"},
																		{hash = 3, missionName = "����3", levelsection = 1, missionKind = "songxin"},
--																		{hash = 4, missionName = "����ɱ��1", levelsection = 1, missionKind = "teshushaguai"},
																		{hash = 5, missionName = "Ѱ��1", levelsection = 1, missionKind = "xunwu"},
																		{hash = 6, missionName = "�߼�Ѱ��1", levelsection = 5, missionKind = "gaojixunwu"},
																		{hash = 7, missionName = "����ʹ����Ʒ1", levelsection = 1, missionKind = "dingdianshiyongwupin"},
																		{hash = 8, missionName = "�ռ�������1", levelsection = 1, missionKind = "shoujishengzhangdian"},
																		{hash = 9, missionName = "�߼�Ѱ��2", levelsection = 4, missionKind = "gaojixunwu"},
																		}
--Define
x300303_MISSION_FAILEDCOUNTRY			=	1
x300303_MISSION_FAILEDROUND				=	2

x300303_MISSION_ACCEPTREADY				=	8

x300303_NPC_START						= 20
x300303_NPC_AIM							= 21
x300303_NPC_FAILED					= 22

x300303_ERROR_UNKNOWN				= -1

x300303_MP_MISSIONHASH			=0
x300303_MP_SONGXIN					=1
x300303_MP_DINGDIANSHIYONGWUPIN =2
x300303_MP_TESHUSHAGUAI			=3
x300303_MP_SHOUJISHENGZHANGDIAN =4
--MisDescEnd

-------------------------
--ConditionCheck
-------------------------
function x300303_ConditionCheck(sceneId, selfId, NPCId)
	return 1;
end
-------------------------
--x300303_IsMissionComplete
--������þ�OK��,�����еĶ����������������- -||
--���ã�OnDefautEvet��ʱ�����ж�
--��missionHash,���Կ��Դӱ��еõ�������������Ϣ
--���ݻ�õ��������ͽ����жϣ���
-------------------------
function x300303_IsMissionComplete(sceneId, selfId, NPCId, missionHash)
	local missionKind = x300303_GetMissionKind(sceneId, selfId,missionHash)
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
	if missionKind == "teshushaguai" then
		return 1;
	elseif missionKind == "songxin" then
		local songxinFlag = GetMissionParam(sceneId, selfId, misIndex, x300303_MP_SONGXIN)
		if songxinFlag == 1 then
			return 1
		else
			return 0
		end
	elseif missionKind == "xunwu" then
		local xunwuItemNum = x300303_GetXunwuItemNum(sceneId, selfId, NPCId, missionHash)
		local xunwuItemID = x300303_GetXunwuItemID(sceneId, selfId, NPCId, missionHash)
		if GetItemCount(sceneId, selfId, xunwuItemID) >= xunwuItemNum then
			return 1
		else
			return 0
		end
	elseif missionKind == "gaojixunwu" then
		local gaojiItemNum = x300303_GetGaojiItemNum(sceneId, selfId, NPCId, missionHash)
		local gaojiItemID = x300303_GetGaojiItemID(sceneId, selfId, NPCId, missionHash)
		if GetItemCount(sceneId, selfId, gaojiItemID) >= gaojiItemNum then
			return 1
		else
			return 0
		end
	elseif missionKind == "dingdianshiyongwupin" then
		local dingdianFlag = GetMissionParam(sceneId, selfId, misIndex, x300303_MP_DINGDIANSHIYONGWUPIN)
		if dingdianFlag == 1 then
			return 1
		else
			return 0
		end
	elseif missionKind == "shoujishengzhangdian" then
		local ShoujiItemNum = x300303_GetShoujiItemNum(sceneId, selfId, NPCId, missionHash)
		local ShoujiItemID = x300303_GetShoujiItemID(sceneId, selfId, NPCId, missionHash)
		if GetItemCount(sceneId, selfId, ShoujiItemID) >= ShoujiItemNum then
			return 1
		else
			return 0
		end
	else
		return 0
	end
end
-------------------------
--OnEnumerate
-------------------------
function x300303_OnEnumerate(sceneId, selfId, NPCId)
	if (x300303_CheckCountry(sceneId,selfId,NPCId) == 1) then
		local NPCName = GetName(sceneId, NPCId)
		local bHaveMission = IsHaveMission(sceneId, selfId, x300303_g_MissionId)
		if NPCName == x300303_g_StartNPC then
			AddNumText(sceneId, x300303_g_ScriptId, x300303_g_MissionName)
		elseif bHaveMission > 0 then
			local misIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
			local missionHash = GetMissionParam(sceneId, selfId, misIndex, x300303_MP_MISSIONHASH)
			local missionKind = x300303_GetMissionKind(sceneId, selfId,missionHash)
			if missionKind == "songxin" then
				local NPCNameRat = x300303_GetMissionNPCName(sceneId, selfId, NPCId, missionHash)
				if NPCNameRat == NPCName then
					AddNumText(sceneId, x300303_g_ScriptId, x300303_g_MissionName)
				end 
			end
		end
	end
end
-------------------------
--OnDefaultEvent
-------------------------
function x300303_OnDefaultEvent(sceneId, selfId, NPCId)
	x300303_ClearData(sceneId, selfId, NPCId)
	local haveMission = IsHaveMission(sceneId, selfId, x300303_g_MissionId)
	local playerLevelSection = x300303_GetPlayerLevelSec(sceneId, selfId, NPCId)
	local AbandonRat = LuaFnGetCurrentTime() - GetMissionData(sceneId, selfId, MD_GUOJIARENWU_LASTABANDON)
	local unacceptedMissionHash = x300303_GetUnAcceptedMission(sceneId, selfId, NPCId)
	if playerLevelSection < 1 then
		BeginEvent(sceneId);
			AddText(sceneId, x300303_g_ErrorMessage_Level);
		EndEvent();
		DispatchEventList(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
	elseif AbandonRat < 900 then
		BeginEvent(sceneId);
			AddText(sceneId, x300303_g_ErrorMessage_Abandon);
		EndEvent();
		DispatchEventList(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
	elseif haveMission <= 0 then
		if unacceptedMissionHash <= 0 then
			x300303_SetUnAcceptedMission(sceneId, selfId, NPCId, playerLevelSection)--û�б����������������
		end
		local str = x300303_GetStartByHash(sceneId, selfId, NPCId, x300303_GetUnAcceptedMission(sceneId, selfId, NPCId))--����ԭ��û�б���ı仯�ˣ�����Getһ�¡�
		BeginEvent(sceneId);
			AddText(sceneId, str);
		EndEvent();
		DispatchMissionInfo(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
	else
		local missionIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
		local missionHash = GetMissionParam(sceneId, selfId, missionIndex, x300303_MP_MISSIONHASH)
		local missionKind = x300303_GetMissionKind(sceneId, selfId,missionHash)
		if missionKind ~= "songxin" then
			if x300303_IsMissionComplete(sceneId, selfId, NPCId, missionHash) <= 0 then
				local str1 = x300303_GetContinueByHash(sceneId, selfId, NPCId, missionHash)
				BeginEvent(sceneId);
					AddText(sceneId, str1);
				EndEvent();
				DispatchEventList(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
			else
			local str2 = x300303_GetEndByHash(sceneId, selfId, NPCId, missionHash)
				BeginEvent(sceneId);
					AddText(sceneId, str2);
				EndEvent();
				DispatchMissionContinueInfo(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
			end
		else
			local NPCNameRat = x300303_GetMissionNPCName(sceneId, selfId, NPCId, missionHash)
			if (NPCNameRat == GetName(sceneId, NPCId)) then
				if x300303_IsMissionComplete(sceneId, selfId, NPCId, missionHash) <= 0 then
					local str1 = x300303_GetContinueXByHash(sceneId, selfId, NPCId, missionHash)
					DelItem(sceneId, selfId, x300303_GetSongxinItemID(sceneId, selfId, NPCId, missionHash), 1)
					BeginEvent(sceneId)
					  local strText = "��ʧȥ����Ʒ  "..x300303_GetSongxinItemName(sceneId, selfId, NPCId, missionHash)
					  AddText(sceneId, strText);
					EndEvent(sceneId)
					DispatchMissionTips(sceneId, selfId)
						local misIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
						SetMissionByIndex(sceneId, selfId, misIndex, x300303_MP_SONGXIN, 1)
					BeginEvent(sceneId);
						AddText(sceneId, str1);
					EndEvent();
					DispatchEventList(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
				else
					local str2 = x300303_GetEndXByHash(sceneId, selfId, NPCId, missionHash)
					BeginEvent(sceneId);
						AddText(sceneId, str2);
					EndEvent();
					DispatchEventList(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
				end	
			else
				if x300303_IsMissionComplete(sceneId, selfId, NPCId, missionHash) <= 0 then
					local str3 = x300303_GetContinueByHash(sceneId, selfId, NPCId, missionHash)
					BeginEvent(sceneId);
						AddText(sceneId, str3);
					EndEvent();
					DispatchEventList(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
				else
					local str4 = x300303_GetEndByHash(sceneId, selfId, NPCId, missionHash)
					BeginEvent(sceneId);
						AddText(sceneId, str4);
					EndEvent();
					DispatchMissionContinueInfo(sceneId,selfId,NPCId,x300303_g_ScriptId,x300303_g_MissionId)
				end			
			end
		end
	end	
end
-------------------------
--OnAbandon
-------------------------
function x300303_OnAbandon( sceneId, selfId)
	SetMissionData(sceneId, selfId, MD_GUOJIARENWU_UNACCEPT, 0)--�����¼���
	SetMissionData(sceneId, selfId, MD_GUOJIARENWU_CIRCLE, 0)--���������񻷼������
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
	local missionHash = GetMissionParam(sceneId, selfId, misIndex, x300303_MP_MISSIONHASH)
	local missionKind = x300303_GetMissionKind(sceneId, selfId,missionHash)
	if missionKind == "songxin" then
		DelItem(sceneId, selfId, x300303_GetSongxinItemID(sceneId, selfId, NPCId, missionHash), 1)
  elseif missionKind == "dingdianshiyongwupin" then
		DelItem(sceneId, selfId, x300303_GetDingdianItemID(sceneId, selfId, NPCId, missionHash), x300303_GetDingdianItemNum(sceneId, selfId, NPCId, missionHash) )
  end
  DelMission( sceneId, selfId, x300303_g_MissionId)--ɾ������
  SetMissionData(sceneId, selfId, MD_GUOJIARENWU_LASTABANDON, LuaFnGetCurrentTime())
  BeginEvent(sceneId)
	  local strText = "�����������  "..x300303_g_MissionName
	  AddText(sceneId, strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId, selfId)
end
-------------------------
--CheckAccept
-------------------------
function x300303_CheckAccept( sceneId, selfId, NPCId)
	--Ӧ���ж��������Ƿ�����
	return 1;
end
-------------------------
--OnAccept
-------------------------
function x300303_OnAccept(sceneId, selfId)
	local UnAccept = GetMissionData(sceneId, selfId, MD_GUOJIARENWU_UNACCEPT)
	local missionKind = x300303_GetMissionKind(sceneId, selfId,UnAccept)
	local DoKill,DoArea,DoItem=0,0,0;--�������ô�����	
	if missionKind == "dingdianshiyongwupin" then
		BeginAddItem(sceneId)
			AddItem( sceneId, x300303_GetDingdianItemID(sceneId, selfId, NPCId, UnAccept), x300303_GetDingdianItemNum(sceneId, selfId, NPCId, UnAccept) )             
		ret = EndAddItem(sceneId,selfId)
	  if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
	  else
		  BeginEvent(sceneId)
			  AddText(sceneId,"��Ʒ����������������������")
			  EndEvent(sceneId)
		  DispatchMissionTips(sceneId,selfId)
			return
		end
	elseif missionKind == "songxin" then
		BeginAddItem(sceneId)
			AddItem( sceneId, x300303_GetSongxinItemID(sceneId, selfId, NPCId, UnAccept), 1)
		ret = EndAddItem(sceneId,selfId)
	  if ret > 0 then
			AddItemListToHuman(sceneId,selfId)
	  else
		  BeginEvent(sceneId)
			  AddText(sceneId,"��Ʒ����������������������")
			  EndEvent(sceneId)
		  DispatchMissionTips(sceneId,selfId)
			return 
		end
	end	
	AddMission( sceneId,selfId, x300303_g_MissionId, x300303_g_ScriptId, DoKill, DoArea, DoItem )		--�������
	SetMissionData(sceneId, selfId, MD_GUOJIARENWU_ROUND, GetMissionData(sceneId, selfId, MD_GUOJIARENWU_ROUND)+1)--round+1
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
	if missionKind == "shoujishengzhangdian" then --�ռ��ĵļ������- -||
		SetHumanAbilityLevel(sceneId, selfId, 26, 1)
		SetMissionByIndex(sceneId, selfId, misIndex, x300303_MP_SHOUJISHENGZHANGDIAN, 1)
	end
	SetMissionByIndex(sceneId, selfId, misIndex, x300303_MP_AIMNPC, UnAccept)
	SetMissionData(sceneId, selfId, MD_GUOJIARENWU_UNACCEPT, 0)--UnAccept���
	
	BeginEvent(sceneId)
	 	strText = "�����������  "..x300303_g_MissionName
	 	AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
-------------------------
--OnSubmit
-------------------------
function x300303_OnSubmit( sceneId, selfId, NPCId, selectRadioId)

	local round = GetMissionData(sceneId, selfId, MD_GUOJIARENWU_ROUND)
	local circle = GetMissionData(sceneId, selfId, MD_GUOJIARENWU_CIRCLE)
	local misIndex = GetMissionIndexByID(sceneId, selfId, x300303_g_MissionId)
	local missionHash = GetMissionParam(sceneId, selfId, misIndex, x300303_MP_MISSIONHASH)
	local missionKind = x300303_GetMissionKind(sceneId, selfId,missionHash)
	local ExpBonus = x300303_GetExpBonus(sceneId, selfId, NPCId, round, circle)
	local MoneyBonus = x300303_GetMoneyBonus(sceneId, selfId, NPCId, round, circle)
--Ѱ��߼�Ѱ��ռ��ɳ��㶼Ҫ���������Ʒ
	if (missionKind == "xunwu") then
		local xunwuItemID = x300303_GetXunwuItemID(sceneId, selfId, NPCId, missionHash)
		local xunwuItemName = x300303_GetXunwuItemName(sceneId, selfId, NPCId, missionHash)
		local xunwuItemNum = x300303_GetXunwuItemNum(sceneId, selfId, NPCId, missionHash)
		DelItem(sceneId, selfId, xunwuItemID, xunwuItemNum)
	  BeginEvent(sceneId)
		  local strText = "��ʧȥ��"..xunwuItemNum.."��"..xunwuItemName
		  AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif (missionKind == "gaojixunwu") then
		local gaojiItemID = x300303_GetGaojiItemID(sceneId, selfId, NPCId, missionHash)
		local gaojiItemName = x300303_GetGaojiItemName(sceneId, selfId, NPCId, missionHash)
		local gaojiItemNum = x300303_GetGaojiItemNum(sceneId, selfId, NPCId, missionHash)
		DelItem(sceneId, selfId, gaojiItemID, gaojiItemNum)
	  BeginEvent(sceneId)
		  local strText = "��ʧȥ��"..gaojiItemNum.."��"..gaojiItemName
		  AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	elseif (missionKind == "shoujishengzhangdian") then
		local shoujiItemID = x300303_GetShoujiItemID(sceneId, selfId, NPCId, missionHash)
		local shoujiItemName = x300303_GetShoujiItemName(sceneId, selfId, NPCId, missionHash)
		local shoujiItemNum = x300303_GetShoujiItemNum(sceneId, selfId, NPCId, missionHash)
		DelItem(sceneId, selfId, shoujiItemID, shoujiItemNum)
	  BeginEvent(sceneId)
		  local strText = "���ȫ����"..shoujiItemName.."������"
		  AddText(sceneId,strText);
		EndEvent(sceneId)
		DispatchMissionTips(sceneId,selfId)
	end
--**����
	AddExp(sceneId,selfId,ExpBonus)
	AddMoney(sceneId,selfId,MoneyBonus)
	local moneyjin = floor(MoneyBonus / 10000);
	local moneyyin = floor(MoneyBonus / 100) - moneyjin * 100;
	local moneytong = MoneyBonus - moneyjin * 10000 - moneyyin * 100;		
	BeginEvent(sceneId);
		AddText(sceneId, format("���ý���%d��%d��%dͭ", moneyjin, moneyyin, moneytong));
	EndEvent();		
	DispatchMissionTips(sceneId, selfId);
	
	SetMissionData(sceneId, selfId, MD_GUOJIARENWU_CIRCLE, mod(circle+1, x300303_g_MaxCircle))
	DelMission(sceneId, selfId, x300303_g_MissionId)
  BeginEvent(sceneId)
	  local strText = "#Y�����������  "..x300303_g_MissionName
	  AddText(sceneId,strText);
	EndEvent(sceneId)
	DispatchMissionTips(sceneId,selfId)
end
-------------------------
--CheckSubmit
-------------------------
function x300303_CheckSubmit(sceneId,selfId, NPCId)
	if IsHaveMission(sceneId, selfId, x300303_g_MissionId) > 0 then
		return 1;
	end
	return 0;
end
-------------------------
--CheckCountry
--!!�����޷���ȡ�Լ��Ĺ��Һ�
-------------------------
function x300303_CheckCountry(sceneId,selfId,NPCId)
	return 1;
end
-------------------------
--ClearData
--��ÿ�ε�ѡ��ʱ�����
-------------------------
function x300303_ClearData(sceneId,selfId, NPCId)
	local dateRat = GetMissionData(sceneId, selfId, MD_GUOJIARENWU_DATE)
	local nowtime = LuaFnGetCurrentTime()
	local today = floor(nowtime / 86400)
	if dateRat ~= today then
		SetMissionData(sceneId, selfId, MD_GUOJIARENWU_DATE, today)--ʱ���óɽ���
		SetMissionData(sceneId, selfId, MD_GUOJIARENWU_ROUND, 0)--Ȧ����
		SetMissionData(sceneId, selfId, MD_GUOJIARENWU_CIRCLE, 0)--������
		SetMissionData(sceneId, selfId, MD_GUOJIARENWU_UNACCEPT, 0)--�����δ���������
	end
end
-------------------------
--UnAcceptedMission
-------------------------
function x300303_GetUnAcceptedMission(sceneId, selfId, NPCId)
	return GetMissionData(sceneId, selfId, MD_GUOJIARENWU_UNACCEPT);
end
-------------------------
--GetPlayerLevelSec
-------------------------
function x300303_GetPlayerLevelSec(sceneId, selfId, NPCId)
	local playerLevel = GetLevel(sceneId, selfId)
	if playerLevel>=10 and playerLevel < 20 then
		return 1;
	elseif playerLevel>=20 and playerLevel < 40 then
		return 2;
	elseif playerLevel>=40 and playerLevel < 60 then
		return 3;
	elseif playerLevel>=60 and playerLevel < 80 then
		return 4;
	elseif playerLevel>=80 and playerLevel < 100 then
		return 5;
	end
	return 0;
end
-------------------------
--MissionCountInLevelSec
--ĳһ�ȼ��ε�Mission��
-------------------------
function x300303_MissionCountByLevelSec(sceneId, selfId, NPCId, levelSec)
	if (levelSec < 1 or levelSec > 5) then
		return -1;
	end
	local k = 0
	for i ,item in pairs(x300303_g_Mission) do
		if(item.levelsection == levelSec) then
			k = k+1;
		end
	end
	return k;
end
-------------------------
--GetMissionHashCount
--ĳһ�ȼ��ε�Mission��
-------------------------
function x300303_GetRandomMissionHash(sceneId, selfId, NPCId, levelSec)

	if (levelSec < 1 or levelSec > 5) then
		return -1;
	end
	local k = 0
	for i ,item in pairs(x300303_g_Mission) do
		if(item.levelsection == levelSec) then
			k = k+1;
		end
	end
	local randomNum = random(1,k)
	for i ,item in pairs(x300303_g_Mission) do
		if(item.levelsection == levelSec) then
			randomNum = randomNum -1;
			if (randomNum == 0) then
				return item.hash;
			end
		end
	end
end
-------------------------
--GetStartByHash
-------------------------
function x300303_GetStartByHash(sceneId, selfId, NPCId, missionHash)
	local missionKind = x300303_GetMissionKind(sceneId, selfId,missionHash)
	if missionKind == "teshushaguai" then
		for i ,item in pairs(x300303_g_Mission_teshushaguai) do
			if(item.hash == missionHash) then
				return item.Start;
			end
		end
	elseif missionKind == "songxin" then
		for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
			if(item.hash == missionHash) then
				return item.Start;
			end
		end
	elseif missionKind == "xunwu" then
		for i ,item in pairs(x300303_g_Mission_xunwu) do
			if(item.hash == missionHash) then
				return item.Start;
			end
		end	
	elseif missionKind == "gaojixunwu" then
		for i ,item in pairs(x300303_g_Mission_gaojixunwu) do
			if(item.hash == missionHash) then
				return item.Start;
			end
		end	
	elseif missionKind == "dingdianshiyongwupin" then
		for i ,item in pairs(x300303_g_Mission_dingdianshiyongwupin pairs(do
			if(item.hash == missionHash) then
				return item.Start;
			end
		end	
	elseif missionKind == "shoujishengzhangdian" then
		for i ,item in pairs(x300303_g_Mission_shoujishengzhangdian) do
			if(item.hash == missionHash) then
				return item.Start;
			end
		end	
	end
end
-------------------------
--GetContinueByHash
-------------------------
function x300303_GetContinueByHash(sceneId, selfId, NPCId, missionHash)
	local missionKind = x300303_GetMissionKind(sceneId, selfId, missionHash)
	if missionKind == "teshushaguai" then
		for i ,item in pairs(x300303_g_Mission_teshushaguai) do
			if(item.hash == missionHash) then
				return item.continue;
			end
		end
	elseif missionKind == "songxin" then
		for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
			if(item.hash == missionHash) then
				return item.continue;
			end
		end
	elseif missionKind == "xunwu" then
		for i ,item in pairs(x300303_g_Mission_xunwu) do
			if(item.hash == missionHash) then
				return item.continue;
			end
		end	
	elseif missionKind == "gaojixunwu" then
		for i ,item in pairs(x300303_g_Mission_gaojixunwu) do
			if(item.hash == missionHash) then
				return item.continue;
			end
		end	
	elseif missionKind == "dingdianshiyongwupin" then
		for i ,item in pairs(x300303_g_Mission_dingdianshiyongwupin pairs(do
			if(item.hash == missionHash) then
				return item.continue;
			end
		end	
	elseif missionKind == "shoujishengzhangdian" then
		for i ,item in pairs(x300303_g_Mission_shoujishengzhangdian) do
			if(item.hash == missionHash) then
				return item.continue;
			end
		end	
	end
end
-------------------------
--GetContinueXByHash
-------------------------
function x300303_GetContinueXByHash(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
		if(item.hash == missionHash) then
			return item.continueX;
		end
	end
end
-------------------------
--GetEndXByHash
-------------------------
function x300303_GetEndXByHash(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
		if(item.hash == missionHash) then
			return item.endstrX;
		end
	end
end
-------------------------
--GetEndByHash
-------------------------
function x300303_GetEndByHash(sceneId, selfId, NPCId, missionHash)
	local missionKind = x300303_GetMissionKind(sceneId, selfId,missionHash)
	if missionKind == "teshushaguai" then
		for i ,item in pairs(x300303_g_Mission_teshushaguai) do
			if(item.hash == missionHash) then
				return item.endstr;
			end
		end
	elseif missionKind == "songxin" then
		for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
			if(item.hash == missionHash) then
				return item.endstr;
			end
		end
	elseif missionKind == "xunwu" then
		for i ,item in pairs(x300303_g_Mission_xunwu) do
			if(item.hash == missionHash) then
				return item.endstr;
			end
		end	
	elseif missionKind == "gaojixunwu" then
		for i ,item in pairs(x300303_g_Mission_gaojixunwu) do
			if(item.hash == missionHash) then
				return item.endstr;
			end
		end	
	elseif missionKind == "dingdianshiyongwupin" then
		for i ,item in pairs(x300303_g_Mission_dingdianshiyongwupin pairs(do
			if(item.hash == missionHash) then
				return item.endstr;
			end
		end	
	elseif missionKind == "shoujishengzhangdian" then
		for i ,item in pairs(x300303_g_Mission_shoujishengzhangdian) do
			if(item.hash == missionHash) then
				return item.endstr;
			end
		end	
	end
end
-------------------------
--SetUnAcceptedMission
-------------------------
function x300303_SetUnAcceptedMission(sceneId, selfId, NPCId, levelSec)
	local hash = x300303_GetRandomMissionHash(sceneId, selfId, NPCId, levelSec)
	SetMissionData(sceneId, selfId, MD_GUOJIARENWU_UNACCEPT, hash)
end
-------------------------
--GetEcpBonus
-------------------------
function x300303_GetExpBonus(sceneId, selfId, NPCId, round, circle)
	return 11;
end
-------------------------
--GetMoneyBonus
-------------------------
function x300303_GetMoneyBonus(sceneId, selfId, NPCId, round, circle)
	return 12345;
end
-------------------------
--GetMissionKind
-------------------------
function x300303_GetMissionKind(sceneId, selfId,missionHash)
	for i ,item in pairs(x300303_g_Mission) do
		if(item.hash == missionHash) then
			return item.missionKind;
		end
	end	
end
-------------------------
--MissionNPCName
-------------------------
function x300303_GetMissionNPCName(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
		if (item.hash == missionHash) then
			return item.NPC_Name;
		end
	end
end
-------------------------
--GetXunwuItemID
-------------------------
function x300303_GetXunwuItemID(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_xunwu) do
		if (item.hash == missionHash) then
			return item.item_ID;
		end
	end
end
-------------------------
--GetXunwuItemName
-------------------------
function x300303_GetXunwuItemName(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_xunwu) do
		if (item.hash == missionHash) then
			return item.item_Name;
		end
	end
end
-------------------------
--GetXunwuItemNum
-------------------------
function x300303_GetXunwuItemNum(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_xunwu) do
		if (item.hash == missionHash) then
			return item.item_Num;
		end
	end
end
-------------------------
--GetGaojiItemID
-------------------------
function x300303_GetGaojiItemID(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_gaojixunwu) do
		if (item.hash == missionHash) then
			return item.item_ID;
		end
	end
end
-------------------------
--GetGaojiItemName
-------------------------
function x300303_GetGaojiItemName(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_gaojixunwu) do
		if (item.hash == missionHash) then
			return item.item_Name;
		end
	end
end
-------------------------
--GetGaojiItemNum
-------------------------
function x300303_GetGaojiItemNum(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_gaojixunwu) do
		if (item.hash == missionHash) then
			return item.item_Num;
		end
	end
end
-------------------------
--GetshoujiItemID
-------------------------
function x300303_GetShoujiItemID(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_shoujishengzhangdian) do
		if (item.hash == missionHash) then
			return item.item_ID;
		end
	end
end
-------------------------
--GetshoujiItemName
-------------------------
function x300303_GetShoujiItemName(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_shoujishengzhangdian) do
		if (item.hash == missionHash) then
			return item.item_Name;
		end
	end
end
-------------------------
--GetshoujiItemNum
-------------------------
function x300303_GetShoujiItemNum(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_shoujishengzhangdian) do
		if (item.hash == missionHash) then
			return item.item_Num;
		end
	end
end
-------------------------
--GetDingdianItemID
-------------------------
function x300303_GetDingdianItemID(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_dingdianshiyongwupin pairs(do
		if (item.hash == missionHash) then
			return item.item_ID;
		end
	end
end
-------------------------
--GetDingdiantemName
-------------------------
function x300303_GetDingdianItemName(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_dingdianshiyongwupin pairs(do
		if (item.hash == missionHash) then
			return item.item_Name;
		end
	end
end
-------------------------
--GetDingdianItemNum
-------------------------
function x300303_GetDingdianItemNum(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_dingdianshiyongwupin pairs(do
		if (item.hash == missionHash) then
			return item.item_Num;
		end
	end
end
-------------------------
--GetSongxinItemID
-------------------------
function x300303_GetSongxinItemID(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
		if (item.hash == missionHash) then
			return item.item_ID;
		end
	end
end
-------------------------
--GetSongxintemName
-------------------------
function x300303_GetSongxinItemName(sceneId, selfId, NPCId, missionHash)
	for i ,item in pairs(x300303_g_Mission_Songxin pairs(do
		if (item.hash == missionHash) then
			return item.item_Name;
		end
	end
end