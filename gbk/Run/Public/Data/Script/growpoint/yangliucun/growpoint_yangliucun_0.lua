--������
--��Ӧ����ܣ��ɿ�	�ɿ��ܵı��4
--�ɿ�
--�ű���301021
--���ʷֲ��Ŀ�ʯ	   0.15	     0.05     0.1     0.05	
--�Ա�����(35%)�õ�����Ʒ12130001,12130002,12130003,12130004 �е�һ�֣�����1
--�ȼ�1

--ÿ�δ򿪱ض���õĲ�Ʒ
x301021_g_MainItemId = 11990001
--����Ʒ
x301021_g_Byproduct = {12130001,12130002,12130003,12130004}
--��Ҫ����Id
x301021_g_AbilityId = 1
--��Ҫ���ܵȼ�
x301021_g_AbilityLevel = 1


--���ɺ�����ʼ************************************************************************
--ÿ��ItemBox�����10����Ʒ
function 		x301021_OnCreate(sceneId,growPointType,x,y)
	--����ItemBoxͬʱ����һ����ƷgrowPointType=1
	targetId  = ItemBoxEnterScene(x,y,1,sceneId,0,x301021_g_MainItemId)	--ÿ�������������ܵõ�һ����Ʒ,����ֱ�ӷ���itembox��һ��
	
end
--���ɺ�������**********************************************************************


--��ǰ������ʼ&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
function	 x301021_OnOpen(sceneId,selfId,targetId)
--��������
-- 0 ��ʾ�򿪳ɹ�
	ABilityID = GetItemBoxRequireAbilityID(sceneId,targetId)
	AbilityLevel = QueryHumanAbilityLevel(sceneId,selfId,ABilityID)
	res = x301021_OpenCheck(sceneId,selfId,ABilityID,AbilityLevel)
	return res
end
--��ǰ��������&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


--���պ�����ʼ########################################################################
function	 x301021_OnRecycle(sceneId,selfId,targetId)
--AddItemToBox();
	BeginAddItem(sceneId)                                                  


	--���1~100�������,����������ɵĵ���
	--����Ʒ1~50�������Ʒ����51~85 ���������86~100û�л�õ���
	local ItemCount = random(1,100)
	local ByproductId = random(1,4)
	
	if ItemCount >= 0 and ItemCount <= 50 then
		AddItem( sceneId,x301021_g_MainItemId, 1 )  
	elseif ItemCount >= 51 and ItemCount <= 65 then
		AddItem( sceneId,x301021_g_Byproduct[ByproductId], 1 )    
	elseif ItemCount >= 65 and ItemCount <= 70 then
		AddItem( sceneId,x301021_g_Byproduct[ByproductId], 1 )
	elseif ItemCount >= 71 and ItemCount <= 80 then
		AddItem( sceneId,x301021_g_Byproduct[ByproductId], 1 )
	elseif ItemCount >= 81 and ItemCount <= 85 then
		AddItem( sceneId,x301021_g_Byproduct[ByproductId], 1 )
	end
         
	ret = EndAddItem(sceneId,selfId)           

	-- ����������
	ABilityID	=	GetItemBoxRequireAbilityID(sceneId,targetId)
	CallScriptFunction(ABILITYLOGIC_ID, "GatherGainExperience", sceneId, selfId, ABilityID, x301021_g_AbilityLevel)
	
	if ret > 0 then                                                  
		BeginEvent(sceneId)
	
		if ItemCount >= 0 and ItemCount <= 50 then
			AddText(sceneId,format("�õ������   %d", LuaFnGetItemCount(sceneId,selfId,x301021_g_MainItemId)+1))
		end
		
		if ItemCount >= 51 and ItemCount <= 85 then
			if  x301021_g_Byproduct[ByproductId] == 12130001 then
				AddText(sceneId,format("1���������   %d", LuaFnGetItemCount(sceneId,selfId,x301021_g_Byproduct[ByproductId])+1))
			elseif x301021_g_Byproduct[ByproductId] == 12130002 then
				AddText(sceneId,format("2���������   %d", LuaFnGetItemCount(sceneId,selfId,x301021_g_Byproduct[ByproductId])+1))
			elseif x301021_g_Byproduct[ByproductId] == 12130003 then
				AddText(sceneId,format("3���������   %d", LuaFnGetItemCount(sceneId,selfId,x301021_g_Byproduct[ByproductId])+1))
			elseif x301021_g_Byproduct[ByproductId] == 12130004  then
				AddText(sceneId,format("4���������   %d", LuaFnGetItemCount(sceneId,selfId,x301021_g_Byproduct[ByproductId])+1))
			end
		end

		if ItemCount >=86 and ItemCount <=100  then
			AddText(sceneId,format("û�вɼ����κο�ʯ"))
		end

	        EndEvent()
		DispatchMissionTips(sceneId, selfId)
		if ItemCount >= 0 and ItemCount <=85  then
	       		AddItemListToHuman(sceneId,selfId) 
		end
		return 1 
	else                                                             
		BeginEvent(sceneId)                                      
		AddText(sceneId,"��Ʒ��������")                    
		EndEvent(sceneId)                                        
		DispatchMissionTips(sceneId,selfId) 
		return 0
	end       

	--����1�����������
	return 1
end
--���պ�������########################################################################



--�򿪺�����ʼ@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
function	x301021_OnProcOver( sceneId, selfId, targetId )
	--local ABilityID = GetItemBoxRequireAbilityID( sceneId, targetId )
	--CallScriptFunction( ABILITYLOGIC_ID, "EnergyCostCaiJi", sceneId, selfId, ABilityID, x301021_g_AbilityLevel )
	return 0
end
--�򿪺�������@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

function	x301021_OpenCheck(sceneId,selfId,AbilityId,AbilityLevel)
	--�������ܵȼ�
	if AbilityLevel < x301021_g_AbilityLevel then
		return OR_NO_LEVEL
	end
	--��龫��
	if GetHumanEnergy(sceneId,selfId)< (floor(x301021_g_AbilityLevel * 1.5 +2) * 2) then
		return OR_NOT_ENOUGH_ENERGY
	end
	return OR_OK
end

