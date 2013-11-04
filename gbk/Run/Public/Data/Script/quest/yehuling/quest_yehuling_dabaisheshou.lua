--�������

--MisDescBegin
x207008_g_ScriptId = 207008
x207008_g_MissionIdPre =8
x207008_g_MissionId = 9
x207008_g_MissionKind = 1
x207008_g_ScriptIdNext = {ScriptId = 207009 ,LV = 1 }
x207008_g_Name	="���������" 
x207008_g_DemandItem ={}
x207008_g_DemandKill ={}	

x207008_g_MissionName="�������"
x207008_g_MissionInfo="    ��Ҫ�ٹ���һЩ���ĵ������ˣ���Щ�£�����ʮ�죬����ʮ�ꡭ���������ɻ���ʹ���С�������ܽ���ҵ�ʹ�࣬�һ���������е�һ�С��������ʹ��ķ���������ɱ���ң�"  --��������
x207008_g_MissionTarget="    ������������"		                                                                                               
x207008_g_MissionComplete="    �á����������֣��ܾ�û�����������Ķ����ˣ������̼��Ľ��֣�������ͨ�ĺܶ����飡\n \n�������ı��飬�Ѿ��³�����˭�˰ɡ�����������û���Ҿ���#G�ܱ�#W��������ܱ����Ѿ��ܾ�û�л�ȥ�ˡ���������\n \nһ�����ڲ�֪���Լ������Ƕ��Ǵ��ʱ�򣬲��������εģ��������飬��׹����Ԩ֮�С���֪��������ʲô��ֻ�ǡ�������#G����#W֪����\n \n#G�ɼ�˼��#W����֮���ӣ��������˹���#G����Ӫ#W�ķ�������ʵֻ��Ҫ���첻���Ĺ�������Ƴǣ���֮������ô������Ϊ����#G����#Wѧ���������̵����С�ֻ��#G����#W����Ůɫ���ô󺹷ǳ�ʧ��������Ϊ��#Gˮ��#W�ǳɾ��˵ĺ��꾫��ֻ��ɱ��#Gˮ��#W���������#G����#W��"					--�������npc˵���Ļ�
x207008_g_ContinueInfo="    ����������ô�õģ�������ֲ���ֻ�ǡ������������ǲ����ܳɴ��µģ���ԭ���ҵ�ֱ�ӣ��٣�"
--������
x207008_g_MoneyBonus = 10000

--�̶���Ʒ���������8��
x207008_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x207008_g_RadioItemBonus={}

--MisDescEnd
--**********************************

--������ں���

--**********************************

function x207008_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x207008_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x207008_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
		if x207008_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x207008_g_MissionName)
			AddText(sceneId,x207008_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x207008_g_MissionTarget) 
			AddText(sceneId,format("\n    ������������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x207008_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x207008_g_MissionName)
		     AddText(sceneId,x207008_g_MissionComplete)
		     AddText(sceneId,"#Y����Ŀ��#W") 
		     AddText(sceneId,x207008_g_MissionTarget) 
		     AddText(sceneId,format("\n    ������������   %d/1", GetMissionParam(sceneId,selfId,misIndex,0) ))
                     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x207008_g_ScriptId, x207008_g_MissionId)
                end

        elseif x207008_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x207008_g_MissionName)
                AddText(sceneId,x207008_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x207008_g_MissionTarget) 
		AddMoneyBonus(sceneId, x207008_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x207008_g_ScriptId, x207008_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x207008_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x207008_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x207008_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x207008_g_ScriptId, x207008_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x207008_CheckAccept(sceneId, selfId, targetId)

	if IsHaveMission(sceneId,selfId, x207008_g_MissionId)<= 0 then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x207008_CheckPushList(sceneId, selfId, targetId)
	if IsMissionHaveDone(sceneId, selfId, x207008_g_MissionIdPre) > 0 then
                    return 1
        end
	
	
end

--**********************************

--����

--**********************************

function x207008_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x207008_g_MissionId, x207008_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x207008_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
		SetMissionByIndex(sceneId,selfId,misIndex,0,1)
		                                               
	     
end



--**********************************

--����

--**********************************

function x207008_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x207008_g_MissionId)

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x207008_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x207008_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == 1 then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x207008_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x207008_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x207008_g_MissionId)
		AddExp(sceneId, selfId, x207008_g_ExpBonus)
		AddMoney(sceneId, selfId, x207008_g_MoneyBonus)
		for i, item in x207008_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x207008_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x207008_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x207008_OnKillObject(sceneId, selfId, objdataId)
	

end



--**********************************

--���������¼�

--**********************************

function x207008_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x207008_OnItemChanged(sceneId, selfId, itemdataId)

end

